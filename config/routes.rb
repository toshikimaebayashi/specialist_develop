Rails.application.routes.draw do

  namespace 'admin' do
    resources :basiccategory
    get 'basicknowleadge/:id/new' => 'basicknowleadge#new'
    post 'basicknowleadge/:id/create' => 'basicknowleadge#create'
    post 'basicknowledge/:id/destroy' => 'basicknowleadge#destroy'

    get 'basicknowleadge/:id/url' => 'basicknowleadge#url'
    post 'basiccategory/create' => 'basiccategory#create'
    post 'basiccategory/:id/update' => 'basiccategory#update'
    post 'basiccategory/:id/destroy' => 'basiccategory#destroy'
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
   
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  root to: 'home#top'

  # ユーザーノート
  get 'usernote/:id' => 'usernote#top'

  # 
  get 'user/:id' => 'user#top'
  get 'profile' => 'profile#top'

  # プロフィール編集
  get 'profile/edit/coverimage' => 'profile#coverimage_edit'
  get 'profile/edit/iconimage' => 'profile#iconimage_edit'
  get 'profile/edit/name' => 'profile#name_edit'
  get 'profile/edit/text' => 'profile#text_edit'

  post 'profile/update/coverimage' => 'profile#coverimage_update'
  post 'profile/update/iconimage' => 'profile#iconimage_update'
  post 'profile/update/name' => 'profile#name_update'
  post 'profile/update/text' => 'profile#text_update'
  post 'profile/destroy' => 'profile#destroy'


  get 'basiccategory' => 'basic#top'
  get 'basiccategory/:id' => 'basic#movie'

  resources :post

  post 'post/create' => 'post#create'
  get 'preview' => 'post#preview'
  post 'post/:id/update' => 'post#update'
  post 'post/:id/destroy' => 'post#destroy'

  post 'post/postimage_upload' => 'post#postimage_upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
