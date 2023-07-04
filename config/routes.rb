Rails.application.routes.draw do
  devise_for :users
  root to: "porcs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :porcs, only: [:index, :new, :create, :show, :edit, :update, :gestion] do
    get "gestion", to: "porcs#gestion"
    resources :prisuttus, only: [:new, :create, :edit, :update]
    resources :lonzus, only: [:new, :create, :edit, :update]
    resources :coppas, only: [:new, :create, :edit, :update]
  end

  resources :abattages, except: [:index, :update] do
    patch "update_abattage", to: "abattages#update_abattage", as: :update_abattage
    get "edit_produits", to: "abattages#edit_produits"
    patch "/update_production", to: "abattages#update_production", as: :update_production
    patch "/update_produits", to: "abattage#update_produits", as: :update_produits
    get "edit_produits", to: "abattages#edit_produits"
    get "/dashboard", to: "abattages#dashboard"
    get "download", to: "abattages#download"
    get "preview", to: "abattages#preview"
  end

  resources :prisuttus, only: [:new, :create]
  resources :lonzus, only: [:new, :create]
  resources :coppas, only: [:new, :create]


  # Defines the root path route ("/")
  # root "articles#index"
end
