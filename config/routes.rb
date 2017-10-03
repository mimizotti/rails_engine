Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "find", to: "search#show"
      end

      resources :invoices, only: [:index, :show]
      resources :merchants, only: [:index, :show]
    end
  end
end
