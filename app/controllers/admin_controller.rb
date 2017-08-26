class AdminController < ApplicationController
	before_filter :deny
	layout 'student'

	def deny
		redirect_to root_path unless current_user.admin?
	end

	def index
		@user = User.all()
		@total = @user.count()
	end

	def users
		@users = User.all()
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new

		if @user.save
			redirect_to root_path
		end
	end


end
