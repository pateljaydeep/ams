class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    userLoginId = params[:name]
    pwd = params[:password]
    begin
      response = RestClient.get("https://atlas:8443/atlas/rest/auth?user=#{userLoginId}&pwd=#{pwd}")
      
      jsonResp = JSON.parse response.body
      
      empId = jsonResp["id"]
    rescue => e
      puts('Exception during REST call for authentication ')
      e.response
    end

    if userLoginId[0] != nil and empId != nil
      session[:user_id] = empId
      session[:user_name] = jsonResp["name"]
      
      redirect_to assets_url
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
