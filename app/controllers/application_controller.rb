class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :login_required
  after_action :set_online
  
  def login_required
    if !logged_in?
      redirect_to new_session_path
    end
  end
  
  private
    # set to online
    def set_online
      if !!current_user
        # using separate Redis database
        # such as $redis_onlines = Redis.new db: 15
        # value not need, only key
        $redis_onlines.set( current_user.id, nil, ex: 15 )
        # 'ex: 10*60' - set time to live - 10 minutes
      end
    end
end
