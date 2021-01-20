Rails.application.routes.draw do
  # This line mounts Solidus's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted,
  # simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here,
  # as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'
  root :to => 'aguzon/home#index'
  get 'admin',                    to: 'root#index'

  namespace :aguzon do
    get '/',                        to: 'home#index'
    get 'index',                    to: 'home#index'
    get 'about_us',                 to: 'home#about_us'
    get 'product_list_left_sidebar', to: 'categories#product_list_left_sidebar'
    get 'searches',                 to: 'searches#index'
    post 'guest_session',           to: 'guest_sessions#guest_session'
    resources :products, only: :show
    resources :categories, only: :show
    resources :home, only: :index
    resources :users, only: :new
    resources :user_sessions, only: [:new, :create, :destroy]
    resources :blog_entry, only: [:index, :show]

    get '/orders/populate', to: 'orders#populate_redirect'
    get '/orders/:id/token/:token' => 'orders#show', as: :token_order
    resources :orders, except: [:index, :new, :create, :destroy] do
      post :populate, on: :collection
      resources :coupon_codes, only: :create
    end

    get '/cart', to: 'orders#edit', as: :cart
    patch '/cart', to: 'orders#update', as: :update_cart
    put '/cart/empty', to: 'orders#empty', as: :empty_cart
  end
end
