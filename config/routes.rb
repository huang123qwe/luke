Luke::Application.routes.draw do


  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins, :controllers => {:registrations => "admin/registrations",
   :sessions => "admin/sessions" }

  devise_for :users, :controllers => {:registrations => "registrations", :passwords => "passwords",
   :sessions => "sessions" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'admin', to: 'admin/users#index', as: :admin
  get "sign_in", to: "sessions#new"
  get "sign_up", to: "registrations#create"
  get "about", to: "welcome#about"

  resources :articles, only: [:show, :index] do
    collection do
      get :list
    end
  end
  resources :products, only: [:show, :index]
  resources :orders, only: [:new, :create]

  namespace :admin do
    root :to => "admin/users#index"
    resources :articles do
      collection do
        get :tags
      end
    end
    resources :users
    resources :doings
    resources :lamps
    resources :products
    resources :orders
    resources :footers
    resources :categories
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:

end
