Rails.application.routes.draw do
  root 'home#index'

  # TODO: comment if PG::UndefinedTable: ERROR: relation "users" does not exist
  devise_for :users, class_name: 'Staff::User::Model'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
