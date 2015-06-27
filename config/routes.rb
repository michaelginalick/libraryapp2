Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'session#index'

    resources :user
  #sessions routes
  get '/session/index' => 'session#index'
  post '/session/login' => 'session#login'
  get '/session/logout' => 'session#logout', :as => 'logout'


  resources :admin
  post '/dashboard/admin_login' => 'dashboard#admin_login'
  get '/dashboard/admin_logout' => 'dashboard#admin_logout'
  get '/dashboard/admin_view/:book_id' => 'dashboard#admin_book_view', :as => 'admin_book_view'
  patch '/dashboard/admin_update/:book_id' => 'dashboard#admin_book_update', :as => 'admin_book_update'
  get '/dashboard/admin_add_book' => 'dashboard#admin#admin_add_book', :as => 'admin_add_book'
  post 'dashboard/create' => 'dashboard#create', :as => 'create_book'
  get 'dashboard/admin_book/:checkout_id' => 'dashboard#admin_book', :as => 'view_checkedout_book'
  get 'dashboard/view_all' => 'dashboard#view_all', :as => 'view_all'
  








  resources :checkout
  post '/checkout/new_checkout' => 'checkout#new_checkout'

  resources :books
  resources :checkin
end
