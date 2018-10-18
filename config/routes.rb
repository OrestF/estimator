Rails.application.routes.draw do
  root 'home#index'
  # devise_for :users # TODO: comment if PG::UndefinedTable: ERROR:  relation "users" does not exist
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
