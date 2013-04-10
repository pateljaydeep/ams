Ams::Application.routes.draw do
  
  resources :asset_assignments

  root :to => "home#index"
  
  get "home" , {:action=>"index", :controller=>"home"}

  resources :asset_assignments
  resources :assets do
    get :unassigned, on: :collection
  end
  resources :asset_types do 
    get :assets, on: :member
  end
  
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
end
