class ApplicationController < ActionController::Base
  
  before_filter :authorize
  
  protect_from_forgery
  
  protected
    def authorize
      unless session[:user_id] != nil
        redirect_to login_url
      end
    end
    
    def page(p) 
      @page = p
    end
    
    def getEmployeesInfoMap
      empRestResp = RestClient.get("https://atlas:8443/atlas/rest/employees")
      jsonResp = JSON.parse empRestResp.body
      employeesMap = {}
      jsonResp.each do|f|
        employeesMap[f["name"]+'['+f["empCode"]+']'] = f["empCode"]
      end
      return employeesMap
    end
    
end
