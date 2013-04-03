Ams::Application.routes.draw do
  
  
  get "home" , {:action=>"index", :controller=>"home"}
  get "/assetsbytype/:type", {:action=>"specificAsset", :controller=>"assets"}
  resources :asset_assignments

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :assets


  resources :asset_types
  
end
