class TweetsController < ApplicationController

  get '/tweets' do
    binding.pry
    if is_logged_in?(session)
      @tweets = Tweet.all
      @user = User.find_by(session[:user_id])
      erb :'tweets/index'
    else
      redirect to "/login"
    end
  end

  get 'tweets/new' do
    if is_logged_in?(session)
      @user = User.find_by(session[:user_id])
      erb :'tweets/new'
    else
      redirect to '/login'
    end
  end

end
