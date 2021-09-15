Rails.application.routes.draw do
  resources :todo_items do
    member do
      patch :change_status
      get :change_title
      get :change_description
    end
  end
end
