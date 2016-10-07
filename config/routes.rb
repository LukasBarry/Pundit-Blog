Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  root 'welcome#landing'

  get 'about' => 'welcome/about'

  resources :blog_posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
    collection do
      get 'user_posts', as: :user
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
