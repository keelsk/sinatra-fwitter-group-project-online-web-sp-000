require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if params[:username] == "" || params[:email] =="" || params[:password] == ""
      redirect "/signup"
    else
      user = User.create(params)
    end
    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect '/tweets'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect '/tweets'
    end
    redirect '/login'
  end

  def logged_in?
    !!session[:user_id]
  end

end
