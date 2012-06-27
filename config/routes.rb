HourTracker::Application.routes.draw do

  resources :participations

  resources :invitations
  resources :sessions, only:[:new,:create,:destroy]
  resources :users
   match '/aboutus', to: 'static_pages#aboutus'
   match '/stories', to: 'static_pages#stories'
   match '/signup/', to: 'users#new'
   match '/signup/:invitation_id', to: 'users#new', as: "new_signup_invitation"
 
   root to: 'static_pages#home'
   match '/newgroup', to: 'groups#new'
   match '/newevent',to:'events#new'
   resources :branchtests
   resources :events
   match '/signin', to: 'sessions#new'
   match '/signout' ,to: 'sessions#destroy', via: :delete
  resources :groups
  #match '/password_reset',to:'password_rests#new'
  resources :password_resets
  resources :groups do
    resources :events
  end
  resources :events do
    resources :participations
  end
  resources :groups do 
    resources :invitations, only: [:new ,:create]
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
