Rails.application.routes.draw do
	resources :students
  devise_for :users
  resources :users_admin, :controller => 'users'


	get 'static/index'
	get 'reports/holds'
	get 'reports/inactive'
	get 'reports/trails'
	get 'admin' => 'admin#index'
	get 'admin/users'

	authenticated :user do
		root 'students#index', as: 'authenticated_root'
	end

	root 'static#index'

end
