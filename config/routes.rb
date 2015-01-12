Rails.application.routes.draw do
    %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
  
  #match "/admin" => redirect("/casein"), :via => :get
  
  namespace :casein, :path => "admin" do
  
    resources :admin_users do
      member do
        patch :update_password, :reset_password
      end
    end
    
    resource :admin_user_session, :only => [:new, :create, :destroy]
    resource :password_reset, :only => [:create, :edit, :update]
        
    match "/blank" => "admin#blank", :via => :get
    root :to => "admin#index"
  end
  
end
