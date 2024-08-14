Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # verb "path", to: "controller#action"#

  get "tasks/list", to: "tasks#list"

  # below 2 routes are for post. first one finds the task, second posts
  get "tasks/new", to: "tasks#new", as: "new_task"
  post "tasks", to: "tasks#create"

  # below 2 routes are for edit. first one finds the task, second patches
  get "tasks/:id/edit", to: "tasks#edit", as: "update_task"
  patch "tasks/:id", to: "tasks#update"

  # delete
  delete "tasks/:id", to: "tasks#destroy"


  # show one task
  get "tasks/:id", to: "tasks#show", as: "task"



end
