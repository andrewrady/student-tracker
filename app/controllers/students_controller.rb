class StudentsController < ApplicationController
	before_action :find_student, only: [:show, :edit, :update, :destroy]
	before_action :deny
	layout 'student'

	def deny
		redirect_to root_path unless user_signed_in? or admin_signed_in?
	end

	def index
		@students = Student.where(user_id: current_user).where('status like ?', '%active').paginate(:page => params[:page], :per_page => 10).order(:name)


		#code to calucalte amount for shane to test
		@studentTotal = Student.where(user_id: current_user).where('status like ?', '%active').count(:name)
		#Students that are split from transfer
		@sharedStudents = Student.where(user_id: current_user).where('status like ?', '%active').where("shared = 't'").count(:shared)	
		#New Students that 208bjj brings in
		@newStudents = Student.where(user_id: current_user).where('status like ?', '%active').where("shared = 'f'").count(:shared)

		#Amount that is shared between 208bjj and Traditional ATA for students transfered 
		@bjjAmount = Student.where(user_id: current_user).where('status like ?', '%active').where("shared = 't'").sum(:amount)

		#Students that joined 208bjj after transfer of program
		@bjjStudents = Student.where(user_id: current_user).where('status like ?', '%active').where("shared = 'f'").sum(:amount)

		#Amount  208bjj gets for new students
		@bjjNewAmount = @bjjStudents*0.8
		#208bjj Amount after split
		@bjjTotal = @bjjAmount/2 + @bjjNewAmount

		#Traditional ATA Amount after split
		@ataNewAmount = @bjjStudents*0.2
		@ataTotal = @bjjAmount/2 + @ataNewAmount

		@amountTotal = Student.where(user_id: current_user).where('status like ?', '%active').sum(:amount)


		#old Code to calucate total with transaction amount
		#@precent = 0.03
		#@total = Student.where(user_id: current_user).where('status like ?', '%active').sum(:amount)
		#@fees = Student.where(user_id: current_user).where('status like ?', '%active').count(:amount)
		#@totalFees = @fees * 0.69
		#@totalPercent = @total * @precent
		#@grandTotal = @total - @totalPercent - @totalFees.round(2)

	end

	def show
		@pos = Student.friendly.find(params[:id]).transactions
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
			params.require(:student).permit(:name, :address, :city, :state, :state, :zip, :status, :rank, :size, :amount, :trail, :phone, :age, :gender, :email, :slug, :shared)
		end

end
