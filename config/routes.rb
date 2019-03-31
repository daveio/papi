Rails.application.routes.draw do
  root to: 'ping#index'
  match '/ping' => 'ping#index', via: :get
  match '/add_task' => 'add_task#index', via: :post
  match '/autoproject' => 'github#autoproject', via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
