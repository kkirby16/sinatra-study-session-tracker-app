require "sinatra"
require "rack-flash"

class UsersController < ApplicationController #any methods you build in application controller will because of this inheriting be available across all of your other controllers.
  use Rack::Flash

  get "/users/login" do
    if !logged_in?
      erb :'users/login'
    else
      redirect "/users/index"
    end #bcrypt hashes and salts users passwords so we don't have string passwords in the database.
  end

  post "/login" do #we're creating a session here... aka we are adding a key/value pair to the session hash.
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) #making sure the user has the right credentials.
      session[:user_id] = user.id #what actually logs the user in.
      redirect "/users/index" #when we redirect we are writing in the url of the request we are sending.
    else
      flash[:message] = "*Make sure you have entered a valid username and password."
      redirect "/users/login" #if wondering whether you should redirect or render think about what route are you in and what is its job? rarely are we going to render from a post, patch or delete request. rendering should happen from a get request.
    end
  end

  get "/users/index" do
    if logged_in?
      erb :'/users/index'
    else
      redirect "/users/login"
    end
  end

  get "/users/signup" do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect "/users/index"
    end
  end

  post "/users" do #here we are creating a new user. restful routing conventions tell us when you are creating a new thing you post to the plural of whatever it is you are creating.
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id

      redirect "/users/index"
    else
      flash[:message] = "*Make sure username and password are both filled in, and that username is unique."
      redirect "/users/signup"
    end
  end

  get "/logout" do
    if logged_in?
      session.destroy
      redirect "/users/login"
    else
      redirect "/"
    end
  end
end
