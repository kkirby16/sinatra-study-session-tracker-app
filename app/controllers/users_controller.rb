class UsersController < ApplicationController #any methods you build in application controller will because of this inheriting be available across all of your other controllers.
  get "/login" do
    erb :login
  end

  post "/login" do #we're creating a session here... aka we are adding a key/value pair to the session hash.
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) #making sure the user has the right credentials.
      session[:user_id] = user.id #what actually logs the user in.
      puts session
      redirect "/index"
    else
      redirect "/login"
    end
  end

  get "/index" do
    "this will be the page welcoming a user."
  end

  get "/signup" do
  end
end
