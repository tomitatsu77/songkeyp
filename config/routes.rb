Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'songs/search' => 'songs#search1'
  get 'artists/search' => 'songs#search2'
  resources :songs, only:[:index,:show,:create,:update,:destroy]
  get 'artists' => 'songs#artist'
  get 'mypage' => 'users#show'
  get 'mypage/edit' => 'users#edit'
  patch 'mypage' => 'users#update'
end
