class SessionsController < ApplicationController
  include SessionsHelper
  include StrongParamsHolder
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(username: sign_up_params[:username])
    if @user
      @user.update_attribute(:dialect_id, sign_up_params[:dialect_id])
      log_in(@user)
      redirect_to rooms_path
    else
      @user = User.create(sign_up_params)
      log_in(@user)
      redirect_to rooms_path
    end
      
    
  end
  
  def destroy
    log_out
    redirect_to new_session_path
  end
  
end
