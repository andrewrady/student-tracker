class StudentsController < ApplicationController
	before_action :find_student, only: [:show, :edit, :update, :destroy]
	before_action :deny
	layout 'student'

	def deny
		redirect_to root_path unless user_signed_in? or admin_signed_in?
	end

	def index
		@students = Student.where(user_id: current_user).where('status like ?', '%active').paginate(:page => params[:page], :per_page => 10).order(:name)

		@contractTotal = HeadOfHouse.all().where(user_id: current_user).count
		@totalStudents = Student.where(user_id: current_user).where('status like ?', '%active').count
	end

	def show
		@pos = Student.friendly.find(params[:id]).transactions
	end

	private
		def find_student
			@student = Student.friendly.find(params[:id])
		end

		def student_params
			params.require(:student).permit(:name, :address, :city, :state, :state, :zip, :status, :rank, :size, :amount, :trail, :phone, :age, :gender, :email, :slug, :shared)
		end

end
