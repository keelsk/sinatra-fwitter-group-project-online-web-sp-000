class TweetsController < ApplicationController

  get '/tweets' do
    redirect '/login' if !logged_in?
    @user = User.find(session[:user_id])
    @tweets = Tweet.all
    erb :'tweets/index'
  end

  get '/tweets/new' do
    redirect to '/login' if !logged_in?
    @user = User.find_by(session[:user_id])
    erb :'tweets/new'
  end

end
