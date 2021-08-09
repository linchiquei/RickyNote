Rails.application.routes.draw do
#get "/notes", to:  "notes#main"
get "/hello" , to: "pages#main"
get "/about" , to: "pages#about"
get "/users" , to: "users#profile"
end

Rails.application.routes.draw do
    resources :notes
  end