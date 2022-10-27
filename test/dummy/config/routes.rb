Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "demande-rendez-vous", to: "home#meeting"
  get "demande-rendez-vous-hub", to: "home#meeting_hub"
  get "demande-rendez-vous-expert-comptable", to: "home#meeting_accountant_company"
end
