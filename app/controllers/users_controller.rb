require "sinatra"
require "rack-flash"

class UsersController < ApplicationController
  use Rack::Flash

  get "/users/login" do
    if !logged_in?
      erb :'users/login'
    else
      redirect "/users/index"
    end #bcrypt hashes and salts users passwords so we don't have string passwords in the database.
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id #what actually logs the user in.
      redirect "/users/index"
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

  post "/users" do
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
