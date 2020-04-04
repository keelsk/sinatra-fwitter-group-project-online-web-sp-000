class TweetsController < ApplicationController

  get '/tweets' do
    @tweets = Tweet.all
    @user = User.find_by_id(session[:user_id])
    binding.pry
    erb :'tweets/index'
  end
end
