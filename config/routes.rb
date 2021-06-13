Rails.application.routes.draw do
  get "customers/my_page" => "customers#show", as: 'customers_my_page'
  get "customers/edit" => "customers#edit", as: 'customers_edit'
  get "customers/verification" => "customers#verification", as: 'customers_destroy'
  patch "customers" => "customers#update", as: 'customers_update'
  put "customers/withdraw" => "customers#withdraw", as: 'customers_withdraw'



devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  root to: 'homes#top'
  get "home/about" => "homes#about"

  resources :items



  get  'inquiry/done', to: 'inquiry#thanks'
  resources :inquiry, only: [:new, :create, :index, :show]
  post 'inquiry/check', to: 'inquiry#check', as: 'check'
  post 'inquiry/back', to: 'inquiry#back', as: 'back'
  post 'inquiry/done', to: 'inquiry#done', as: 'done'


  resources :ansers
  post 'ansers/check', to: 'ansers#check', as: 'ansesr_check'
  post 'ansers/back', to: 'ansers#back', as: 'ansers_back'
  post 'ansesr/done', to: 'ansesr#done', as: 'ansers_done'




  delete "cart_items/destroy_all" => "cart_items#destroy_all",as:'cart_items_all'





  namespace :admin do
    get "/" => "homes#top"
    resources :items
    resources :customers
    resources :genres
    resources :orders
    resources :order_items

  end
  namespace :customers do
    delete "cart_items/destroy_all" => "cart_items#destroy_all",as:'cart_items_all'
    resources :cart_items
    get "orders/check" => "orders#check", as:'orders_check'
    get "orders/done" => "orders#done", as:'orders_done'
    resources :orders
    resources :addresses
  end
end
