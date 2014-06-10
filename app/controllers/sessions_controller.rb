class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You are now logged in'
      redirect_to root_path
    else
      #flash[:error] = "There's something wrong with username or password"
      #binding.pry
      #redirect_to login_path

      flash.now[:error] = "There's something wrong with your username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out"
    redirect_to root_path
  end

end
