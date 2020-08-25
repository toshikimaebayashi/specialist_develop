Rails.application.routes.draw do
  root to: 'home#top'

  # ユーザーノート
  get 'usernote/:id' => 'usernote#top'

  # 
  get 'user/:id' => 'user#user'
  get 'mypage' => 'user#mypage'
  get 'basiccategory' => 'basic#top'
  get 'basiccategory/:id' => 'basic#movie'

  resources :post

  post 'post/create' => 'post#create'
  post 'post/:id/update' => 'post#update'
  post 'post/:id/destroy' => 'post#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
