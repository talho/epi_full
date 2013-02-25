Epi::Application.routes.draw do


  resources :templates, :only => ["show"]

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  match "svg/:chart_type/:model(.:format)" => "svg#chart", :defaults => {format: :svg}
end
