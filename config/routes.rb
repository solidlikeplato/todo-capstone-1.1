Rails.application.routes.draw do
  resources :todo_items do
    member do
      patch :change_status
    end
  end
end
