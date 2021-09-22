Rails.application.routes.draw do
  resources :authors do
    resources :todo_items do
      member do
        post :create
      end
    end
  end

  resources :authors do
    member do
      get :change_name
    end
  end

  resources :todo_items do
    member do
      patch :change_status
      get :change_title
      get :change_description
    end
  end

  root "authors#index"
end
