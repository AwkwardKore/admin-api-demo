Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :tasks
  end
end
