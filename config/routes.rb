Rails.application.routes.draw do
  root "creatures#index"

  get "/creatures", to: "creatures#index",  as: "creatures"
  get "/creatures/new", to: "creatures#new", as: "new_creatures"
  post "/creatures", to: "creatures#create"
  get "/creatures/:id", to: "creatures#show", as: "creature"
end
