Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: [:create]
  end

  resources :plants, only: :destroy do
    resources :plant_labels, only: %i[new create]
  end
end