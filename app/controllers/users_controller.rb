class UsersController < ApplicationController #any methods you build in application controller will because of this inheriting be available across all of your other controllers.
  get "/login" do
    erb :login
  end

  get "/signup" do
  end
end
