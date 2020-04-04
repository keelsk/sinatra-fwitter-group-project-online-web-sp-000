class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      @user = User.find_by(session[:user_id])
    else
      redirect to "/login"
    end
    erb :'tweets/index'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
  end
end
