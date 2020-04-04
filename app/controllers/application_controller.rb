require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :Sessions
    set :session_secret, "fwitter"
  end

  get '/' do
    @session = session
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
  end

end
