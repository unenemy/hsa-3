Rails.application.routes.draw do
  resources :posts

  get :mongo, to: "stress#mongo"
  get :elastic, to: "stress#elastic"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
