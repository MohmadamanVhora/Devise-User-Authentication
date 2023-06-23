Rails.application.routes.draw do
  scope '(:locale)' do
    root 'tweets#index'
    devise_for :users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
