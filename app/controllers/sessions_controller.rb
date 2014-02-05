class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    userLoginId = params[:name]
    pwd = params[:password]
    authIssue = nil;
    empId = nil;

    begin
        ldap = Net::LDAP.new
        ldap.host = "ldap.ketera.com"
        ldap.port = "389"
        ldap.auth "uid=#{userLoginId},ou=users,dc=ketera,dc=com", "#{pwd}"
          
        if ldap.bind
          puts "Authentication successful"
          session[:user_id] = userLoginId                                                                                 
          session[:user_name] = userLoginId
          redirect_to home_url
        else
          puts ldap.get_operation_result
          authIssue = true
          redirect_to login_url, alert: "Unauthorized Login"
        end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to login_url
  end
end
