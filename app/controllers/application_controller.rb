require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :Sessions
    set :session_secret, "flah;eo gua;o jtl.ejg;oiuyav"
  end

  get '/' do
    @session = session
    erb :index
  end

  helpers do
    def is_logged_in?(session)
      !!session[:user_id]
    end
  end

end
