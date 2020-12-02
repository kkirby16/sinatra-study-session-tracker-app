require "./config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions #because of this and the lower line we will now have access to a hash called session that we can manipulate and which will be the way we log users in and out.
    set :session_secret, "study_session_tracker_secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) #returns nil if you pass in a key value pair that doesn't match.
    end #the first time current user is referenced within scope of application controller, this @current_user variable will get created and assigned if the user is found, otherwise it will still be nil. and that way a subsequent call to @current_user if it is already called won't hit the database again. so this is like a little energy saver.

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/users/login"
      end
    end

    def redirect_if_not_authorized
      if @studylist.user != current_user
        flash[:message] = "*You are not authorized to do this action."
        redirect "/users/index"
      end
    end
  end
end
