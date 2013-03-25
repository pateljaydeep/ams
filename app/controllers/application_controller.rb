class ApplicationController < ActionController::Base
  
  before_filter :authorize
  
  protect_from_forgery
  
  protected
    def authorize
      unless session[:user_id] != nil
        redirect_to login_url, notice: "Please log in"
      end
    end
    
    def page(p) 
      @page = p
    end
    
end
