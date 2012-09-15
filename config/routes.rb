SwoleTracker::Application.routes.draw do
  # Welcome Controller
  get "welcome/index"

  match 'welcome' => 'welcome#index'

  # UserSessions Controller
  match 'login' => 'user_sessions#new', :as => :login, :via => 'get'
  match 'login' => 'user_sessions#create', :as => :login, :via => 'post'
  match 'logout' => 'user_sessions#destroy'

  # Users Controller
  resources :users
  resource :user, :as => 'account'

  match 'signup' => 'users#new', :as => :signup, :via => 'get'
  match 'signup' => 'users#create', :as => :signup, :via => 'post'

  # Health Tracker Controller
  get "health_tracker/index"

  match 'health_tracker' => 'health_tracker#index'

  # Workout Tracker
  get "workout_tracker/index"
  post "workout_tracker/track"

  match 'workout_tracker' => 'workout_tracker#index'

  # WorkoutTracker fulfils ExerciseEntries actions
  # resources :exercise_entries

  resources :exercise_details, :only => [:edit, :update, :destroy]

  resources :exercises

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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
