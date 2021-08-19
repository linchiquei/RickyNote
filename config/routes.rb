Rails.application.routes.draw do

get "/hello" , to: "pages#main"
get "/about" , to: "pages#about"
#get "/users" , to: "users#profile"
end

Rails.application.routes.draw do
    resources :notes do
      resources :comments, only: [:index, :create]
    end
    resources :comments, only: [:show, :destroy]
      
    get "/", to: "notes#index"

    resources :users, only: [:create] do
      collection do
        get :sign_up #GET /users/sign_up 註冊表單
        get :sign_in #GET /users/sign_in 登入表單
        #post :sign_in #POST /users/sign_in 登入
      end
    end

    post "/users/sign_in", to: "sessions#create"
    delete '/users', to: 'sessions#destory', as: 'logout'
  end