class TweetsController < ApplicationController

  get '/tweets' do
    if is_logged_in?(session)
      @user = User.find(session[:user_id])
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
