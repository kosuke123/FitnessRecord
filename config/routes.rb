Rails.application.routes.draw do
  devise_for :users, controllers: {   
    registrations: 'users/registrations',
    sessions: 'users/sessions' }

  get 'chart_sample/index' => 'chart_sample#index'
  resources :articles
  get 'kinds/index' => 'kinds#index'
  get 'kinds/:id' => 'kinds#show' ,as: 'kinds'

  get 'users/show/:id' => 'users#show' ,as: 'users_show'

  get 'trainings/new' => 'trainings#new'
  get 'trainings/index' => 'trainings#index'
  root 'trainings#index'
  post 'trainings/create' => 'trainings#create'
  post 'trainings/:id/update' => "trainings#update"
  get 'trainings/:id' => 'trainings#show'
  resources :trainings do
    resources :likes, only: [:create, :destroy]
  end

  get 'users/_follow_form' => 'users#_follow_form'

  get 'explanation/top' => 'explanation#top'
  
  get 'chart_sample/index' => 'chart_sample#index'
  get  'articles#index' => 'article#index'

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
