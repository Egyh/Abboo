Rails.application.routes.draw do


  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  # ユーザー用
# URL /user/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


 scope module: :public do
  root to: "homes#top"
  get "/homes/public/about" => "homes#about", as: "about"
  get 'relationships/followings'
  get 'relationships/followers'
  get '/article/hashtag/:name', to: "articles#hashtag"
  get "search" => "searches#search"
  get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]


 resources :articles, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
   resources :article_comments, only:[:create, :destroy]
   resource :favorites, only: [:create, :destroy,]
 end

  resources :users, only: [:index,:show,:edit,:update] do
     member do
      get :favorites
    end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
 end

end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
   root to: "homes#top"
   resources :articles, only: [:index, :show, :edit, :update, :destroy]
   resources :users, only: [:index, :show, :edit, :update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

