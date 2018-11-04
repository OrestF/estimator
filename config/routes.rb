Rails.application.routes.draw do
  root 'home#index'

  # TODO: comment if PG::UndefinedTable: ERROR: relation "users" does not exist
  devise_for :users, class_name: 'Staff::User::Model'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      namespace :estimation do
        resources :tasks, only: [] do
          collection do
            get :search
          end
        end
      end
    end
  end
end
