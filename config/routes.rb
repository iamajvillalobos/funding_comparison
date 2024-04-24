Rails.application.routes.draw do
  require "sidekiq/web"

  get "up" => "rails/health#show", as: :rails_health_check

  resource :dashboard, only: :show

  root "dashboards#show"
  mount Sidekiq::Web => "/sidekiq"
end
