require 'sidekiq/web'
Rails.application.routes.draw do

  devise_for :agents, :controllers => {
      :registrations => :registrations,
      :sessions => :sessions,
      :passwords => :passwords
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
  mount Sidekiq::Web => '/sidekiq'

  resources :attendances
  resources :users
  resources :star_mothers, only: [:index, :show]

  resources :events do
    collection do
      get :upcomings
      get :histories
    end
  end

  #root :to => redirect('/admin')
  root :to => redirect('/upcomings')

  get 'upcomings', to: 'events#upcomings'
  get 'index', to: 'events#upcomings'
  get 'history', to: 'events#history'

  post 'attendances /join', to: 'attendances#join'

  get 'agents/:wechat/histories' => 'agents#histories'
  get 'agents/:wechat/upcomings' => 'agents#upcomings'

end
