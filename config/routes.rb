Rails.application.routes.draw do
    %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
  
  #match "/admin" => redirect("/casein"), :via => :get
  
  namespace :casein, :path => "admin" do
  
    post "versions/:id/revert" => "versions#revert", :as => "revert_version"
    
    get "/dashboard" => "casein#blank"
    get "versions/allversions" => "versions#allversions"
    
    resources :admin_users do
      member do
        patch :update_password, :reset_password
      end
    end
    
    resource :admin_user_session, :only => [:new, :create, :destroy]
    resource :password_reset, :only => [:create, :edit, :update]
        
    match "/blank" => "casein#blank", :via => :get
    root :to => "casein#index"
  end
  
end
