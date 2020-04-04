require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.create(params)
    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect '/tweets'
    end
    redirect '/signup'
  end

end
