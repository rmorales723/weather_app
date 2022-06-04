Rails.application.routes.draw do
  #  get  'home/zipcode'
  resources :home, only: [:index]
   post 'zipcode' => 'home#zipcode'
   root 'home#index'
  # having problem with path...added resources to bypass
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
