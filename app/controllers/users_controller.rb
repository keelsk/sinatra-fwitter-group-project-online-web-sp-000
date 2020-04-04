require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.create(params)
    user[:id] = session
    redirect '/tweets'
  end

end
