Rails.application.routes.draw do
  root to: 'ping#index'
  match '/ping' => 'ping#index', via: :get
  match '/add_task' => 'add_task#index', via: :post
  # details on the routing DSL at http://guides.rubyonrails.org/routing.html
end
