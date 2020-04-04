require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.create(params)
    if user && user.authenticate(params[:password])
      user[:id] = session
    else
      redirect '/signup'
    end
    redirect '/tweets'
  end

end
