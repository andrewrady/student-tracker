Rails.application.routes.draw do
	resources :students, :only => [:index, :show]
	resources :contracts, :only => [:index, :show]
	devise_for :users
	#resources :users_admin, :controller => 'users'
	#resources :transactions
	#resources :products do 
	#  get :autocomplete_brand_name, :on => :collection
	#end	

	#apis
	namespace :api do
		namespace :v1 do
			resources :users, :only => [:index, :show] do 
				resources :students, :only => [:index, :show, :create, :update, :destroy]
				resources :contracts, :only => [:index, :show, :create, :update, :destroy]
			end
		end
	end

	get 'static/index'
	get 'admin' => 'admin#index'
	get 'admin/users'
	get 'search' => 'static#search'

	authenticated :user do
		root 'students#index', as: 'authenticated_root'
	end

	root 'static#index'

end
