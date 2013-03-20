class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    userid = params[:name]
    pwd = params[:password]
    empCode = nil
    begin
      response = RestClient.get("https://atlas:8443/atlas/rest/auth?user=#{userid}&pwd=#{pwd}")
      
      jsonResp = JSON.parse response.body
      
      empCode = jsonResp["empCode"]
    rescue => e
      puts('Exception during REST call for authentication ')
      e.response
    end

    if userid[0] != nil and empCode != nil
      session[:user_id] = userid
      
      redirect_to assets_url, notice: "You are logged in as #{userid} "
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end
end
