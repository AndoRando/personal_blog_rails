Rails.application.routes.draw do
  root :to => 'posts#index'

  resources :posts do
    resources :tags, :except => [:index, :show]
  end
end
