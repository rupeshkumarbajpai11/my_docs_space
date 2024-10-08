Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :file_records do
    member do
      patch :share  # To create a shared URL
    end
  end

  # Route to access the file via the shared URL
  get 'files/:shared_url', to: 'public_files#show', as: 'public_file'

  root to: "file_records#index"
end
