Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :quizzs, shallow: true do
    resources :cards do
      resources :student_evaluations, only: [:index, :create, :show]
    end
  end

  resources :classrooms
  resources :shares, only: [:new, :create]

  namespace :students do
    resources :quizzs, only: [:show, :index]
  end

end
