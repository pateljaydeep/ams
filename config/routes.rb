Ams::Application.routes.draw do
  
  root :to => "home#index"
  
  get "home" , {:action=>"index", :controller=>"home"}
  get "/assetsbytype/:typeId", {:action=>"specificAsset", :controller=>"assets"}
  

  resources :asset_assignments
  resources :assets
  resources :asset_types
  
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
end
