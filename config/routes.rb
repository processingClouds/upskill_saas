Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controller:{ registrations: 'users/registrations'}
  get 'about', to: 'pages#about'
  resources :contacts, only: [:create]
  get 'contact', to: 'contacts#new', as: 'new_contact'
  
end
