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
end
