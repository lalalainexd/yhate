MyStory::Application.routes.draw do
  root to: "application#index"
  resources :stories, only: [:new, :create]
end
