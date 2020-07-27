# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#                      root GET    /                                                                                        welcome#index
#          new_user_profile GET    /users/:user_id/profile/new(.:format)                                                    user_profile#new
#         edit_user_profile GET    /users/:user_id/profile/edit(.:format)                                                   user_profile#edit
#              user_profile GET    /users/:user_id/profile(.:format)                                                        user_profile#show
#                           PATCH  /users/:user_id/profile(.:format)                                                        user_profile#update
#                           PUT    /users/:user_id/profile(.:format)                                                        user_profile#update
#                           DELETE /users/:user_id/profile(.:format)                                                        user_profile#destroy
#                           POST   /users/:user_id/profile(.:format)                                                        user_profile#create
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                     blogs GET    /blogs(.:format)                                                                         blogs#index
#                           POST   /blogs(.:format)                                                                         blogs#create
#                  new_blog GET    /blogs/new(.:format)                                                                     blogs#new
#                 edit_blog GET    /blogs/:id/edit(.:format)                                                                blogs#edit
#                      blog GET    /blogs/:id(.:format)                                                                     blogs#show
#                           PATCH  /blogs/:id(.:format)                                                                     blogs#update
#                           PUT    /blogs/:id(.:format)                                                                     blogs#update
#                           DELETE /blogs/:id(.:format)                                                                     blogs#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :users do
    resource :profile,:controller => "user_profile"
  end

  resources :blogs do
    member do
      post :add_tag
      post :delete_tag
    end
  end

  resources :tags
end
