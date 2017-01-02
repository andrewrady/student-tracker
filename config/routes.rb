Rails.application.routes.draw do
	resources :students
	devise_for :users
	resources :users_admin, :controller => 'users'
	resources :transactions
	resources :products do 
	  get :autocomplete_brand_name, :on => :collection
	end	

	get 'static/index'
	get 'reports/holds'
	get 'reports/inactive'
	get 'reports/trails'
	get 'admin' => 'admin#index'
	get 'admin/users'
	get 'search' => 'static#search'

	authenticated :user do
		root 'students#index', as: 'authenticated_root'
	end

	root 'static#index'

end
