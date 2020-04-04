class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      @user = User.find_by(session[:user_id])
      erb :'tweets/index'
    else
      redirect to "/login"
    end
  end

  helpers do
    def is_logged_in?(session)
      !!session[:user_id]
    end
  end

end
