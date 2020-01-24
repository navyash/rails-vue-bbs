Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :topics
      resources :categories
      resources :topic_categories, only: [:show], param: :topic_id, constraints: { topic_id: /\d+/ }
      resources :comments
      resources :search, only: [:show], param: :word
      resources :users, only: [:index]
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          registrations: 'api/v1/auth/registrations'
      }
    end
  end
  root to: 'index#index'
  get '*path', to: 'index#index'
end
