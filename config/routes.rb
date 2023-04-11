Rails.application.routes.draw do

  # ユーザー用
# URL /user/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


 scope module: :public do
  root to: "homes#top"
  get "/homes/public/about" => "homes#about", as: "about"
  
  
 resources :articles, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
   resources :article_comments, only:[:create, :destroy]
   resource :favorites, only: [:create, :destroy]
end

  resources :users, only: [:index,:show,:edit,:update] do

end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
end