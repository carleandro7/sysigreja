Rails.application.routes.draw do
  devise_for :users , 
  controllers: { 
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }, 
  path_names: { 
    sign_in: 'login', 
    sign_out: 'logout' 
  }
  devise_scope :users do
    get 'signin', to: 'users/sessions#new'
    get 'signout', to: 'users/registrations#destroy'
  end

  root to: "users#menu"
  

  resources :visita
  resources :users, :path => "users" do
    collection do
      get "/ajuda" => "users#ajuda", :as => "ajuda"
      get "/permissaonegada" => "users#permissaonegada", :as => "permissaonegada"
      get "menu" => "users#menu", :as => "menu"
      get "/alterarsenha" => "users#alterarsenha", :as => "alterarsenha"
      get "/menuusuariologado/:layout" => "users#menuusuariologado", :as => "menuusuariologado"
    end
  end
  resources :igrejas
  resources :distritos

  resources :audits, :path => "audits" do
    collection do
      get "relatorio/:modelnome/:nome" => "audits#relatorio", :as => "relatorio"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
