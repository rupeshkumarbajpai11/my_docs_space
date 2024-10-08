Rails.application.routes.draw do

  # Devise routes for user authentication, using a custom registrations controller
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # File records resource, with an additional member route for sharing (creating a shared URL)
  resources :file_records do
    member do
      patch :share  # Route to create a shared URL
    end
  end

  # Route to access the file via the shared URL (for public access)
  get 'files/:shared_url', to: 'public_files#show', as: 'public_file'

  # Root path of the application
  root to: "file_records#index"
end
