Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items do
        member do
          put :restore_removed_item
        end
      end
    end
  end
end
