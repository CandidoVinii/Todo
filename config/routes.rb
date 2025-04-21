Rails.application.routes.draw do
  get "todos_itens/index"
  get "todos_itens/show"
  get "todos_itens/new"
  get "todos_itens/create"
  get "todos_itens/edit"
  get "todos_itens/update"
  get "todos_itens/destroy"
  get "todo_lists/index"
  get "todo_lists/show"
  get "todo_lists/new"
  get "todo_lists/create"
  get "todo_lists/edit"
  get "todo_lists/update"
  get "todo_lists/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
