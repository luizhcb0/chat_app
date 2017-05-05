class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(username: params[:username])
    if @user
      log_in(@user)
      redirect_to rooms_path
    else
      @user = User.create(username: params[:username])
      log_in(@user)
      redirect_to rooms_path
    end
      
    
  end
  
  def destroy
    log_out
    redirect_to new_session_path
  end
  
end
