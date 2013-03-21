class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    userLoginId = params[:name]
    pwd = params[:password]
    authIssue = nil;
    begin
      response = RestClient.get("https://atlas:8443/atlas/rest/auth?user=#{userLoginId}&pwd=#{pwd}")
      
      jsonResp = JSON.parse response.body
      
      empId = jsonResp["id"]
    rescue => e
      puts('Exception during authentication ')
      authIssue = true
    end

    if userLoginId[0] != nil and empId != nil
      authorizedRoles = ['admin', 'user-30', 'user-20', 'user-10']
      if authorizedRoles.include? jsonResp["role"]
        session[:user_id] = empId
        session[:user_name] = jsonResp["name"]
        redirect_to assets_url, notice: "You are logged in as #{userLoginId} "
      else
        redirect_to login_url, alert: "Unauthorized Login"
      end
    elsif authIssue
      redirect_to login_url, alert: "Unable to authenticate"
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to login_url, notice: "Logged out"
  end
end
