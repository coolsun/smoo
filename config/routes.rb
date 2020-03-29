Rails.application.routes.draw do
  devise_for :users, path: 'apis/users', controllers: {
    sessions: 'sessions'
  }

  # 不用認證的api
  scope :apis, defaults: {format: :json} do
    get 'users/get_current_user', to: 'users#get_current_user'
  end

  # 須認證的api
  namespace :apis, defaults: {format: :json} do
    resources :roles
    resources :sites do
      member do
        put :disable_enable_site
      end
    end

    resources :locations do
      collection do
        get :graphs
      end

      member do 
        get :get_location_logs
        get :mppts
        get :graph
        put :disable_enable_location
        get :tree
        get :device_props
      end
    end

    resources :devices do
      collection do
        post :upload_new_device
        get  :upload_new_device
        post :upload_new_device_property
        get  :upload_new_device_property
      end

      member do 
        patch :update_mppt_coordinates
      end
    end
    
    resources :device_models do
      member do 
        get :get_properties
        put :update_properties
      end
    end

    resources :device_types do
      member do 
        get :get_normalization_properties
        put :update_normalization_properties
      end
    end

    resources :users do
      member do
        get :get_user_roles
        put :update_user_roles
      end
    end

    resources :error_logs 

    resources :global_configs

    resources :boards do 
      member do
        get :edit_locations
        get :edit_locations_order
        put :update_locations
        put :update_locations_order
      end
    end
  end

  get '*path', to: 'application#render_vue'
end
