class StaticController < ApplicationController
  layout 'student', :only => :search
  helper_method :resource_name, :resource, :devise_mapping
  
  def index
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def search
		if params[:search]
			@search = Student.search(params[:search])
		else
			'nothing'
		end
	end
end
