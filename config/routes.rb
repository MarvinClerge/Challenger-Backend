Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      # SessionsController routes
      post "/login", to: "sessions#login";
      post "/signup", to: "sessions#signup";
      get "/current", to: "sessions#get_current_user";

      # Challenge routes
      get "/challenges", to: "challenges#index"
      get "/challenge/:id", to: "challenges#show"

      # UserChallenge routes
      get "/user_challenge", to: "user_challenges#show"
      post "/complete", to: "user_challenges#create"

      #Like routes
      post "/like", to: "likes#create"
      delete "/like", to: "likes#destroy"
    end
  end

end
