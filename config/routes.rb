Rails.application.routes.draw do
  root to: 'home#show'

  resources :users do
    collection do
      post :login, as: :login
    end
  end

  resources :lists, shallow: true do
    resources :items, except: [:index]
  end
end
