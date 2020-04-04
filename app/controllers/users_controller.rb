require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if logged_in?
      direct '/tweets'
    elsif params[:username] == "" || params[:email] =="" || params[:password] == ""
      redirect "/signup"
    else
      user = User.create(params)
    end
    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect '/tweets'
    end
  end

  def logged_in?
    !!session[:user_id]
  end

end
