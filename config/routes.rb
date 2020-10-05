Rails.application.routes.draw do
  post 'store-bahamas-client/:id', to: 'clients#store_bahamas_client'
  get 'retrieve-bahamas-client/:id', to: 'clients#retrieve_bahamas_client'
end
