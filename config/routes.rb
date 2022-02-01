Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'about' => 'homes#top'
  resources :songs, only:[:index,:show,:create,:update,:destroy]
  
  get 'mypage' => 'users#show'
  get 'mypage/edit' => 'users#edit'
  patch 'mypage' => 'users#update'
end
