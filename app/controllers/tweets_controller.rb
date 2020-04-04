class TweetsController < ApplicationController

  get '/tweets' do
    @tweets = Tweet.all
    @user = User.find_by(session[:user_id])
    binding.pry
    erb :'tweets/index'
  end
end
