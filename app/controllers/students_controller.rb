class StudentsController < ApplicationController
	before_action :find_student, only: [:show, :edit, :update, :destroy]
	before_action :deny
	layout 'student'

	def deny
		redirect_to root_path unless user_signed_in? or admin_signed_in?
	end
	
	def index
		@students = Student.where(user_id: current_user).where('status like ?', '%active')

		@precent = 0.03
		@total = Student.where(user_id: current_user).where('status like ?', '%active').sum(:amount)
		@fees = Student.where(user_id: current_user).where('status like ?', '%active').count(:amount)
		@totalFees = @fees * 0.69
		@totalPercent = @total * @precent
		@grandTotal = @total - @totalPercent - @totalFees.round(2)
	end

	def show

	end

	def new
		@student = current_user.students.build
	end

	def create
		@student = current_user.students.build(student_params)

		if @student.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update
	 	if @student.update(student_params)
	 		redirect_to root_path
	 	else
	 		render 'edit'
	 	end
	end

	def destroy
		@student.destroy
		redirect_to student_path

	end

	private
		def find_student
			@student = Student.friendly.find(params[:id])
		end

		def student_params
			params.require(:student).permit(:name, :address, :city, :state, :state, :zip, :status, :rank, :size, :amount, :trail, :phone, :age, :gender, :email, :slug)
		end

end
