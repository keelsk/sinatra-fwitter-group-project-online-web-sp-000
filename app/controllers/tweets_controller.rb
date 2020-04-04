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

end
