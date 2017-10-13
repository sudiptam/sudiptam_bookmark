Bookmark::Application.routes.draw do

  scope "api" do
    resources :histories
    resources :tags
    match '/favorites' , controller: 'histories' , action: 'showFavorite', via: :get
    match '/archive' , controller: 'histories' , action: 'showArchive', via: :get
    match '/folder/:id' , controller: 'histories' , action: 'showSelected', via: :get
  end

  root to: 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
