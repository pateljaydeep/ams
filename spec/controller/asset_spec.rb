require 'spec_helper'

describe AssetsController, type: :controller do 
  describe "GET #download" do 
    it "responds successfully with and HTTP 200 status code" do 
      assets = Asset.create
      get :download
      # expect(assigns(:assets)).to eq([assets])
    end
  end
end
