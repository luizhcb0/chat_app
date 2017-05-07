class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :login_required
  
  def login_required
    if !logged_in?
      redirect_to new_session_path
    end
  end

end
