class ReportsController < ApplicationController
	layout 'student'
	def holds
		@students = Student.where(user_id: current_user).where('status like ?', '%hold').paginate(:page => params[:page], :per_page => 20)

		@precent = 0.03
		@total = Student.where(user_id: current_user).where('status like ?', '%hold').sum(:amount)
		@fees = Student.where(user_id: current_user).where('status like ?', '%hold').count(:amount)
		@totalFees = @fees * 0.69
		@totalPercent = @total * @precent
		@grandTotal = @total - @totalPercent - @totalFees.round(2)
	end

	def inactive
		@students = Student.where(user_id: current_user).where('status like ?', '%quit').paginate(:page => params[:page], :per_page => 20)
	end

	def trails
		@students = Student.where(user_id: current_user).where('status like ?', '%trail').paginate(:page => params[:page], :per_page => 20)
	end
end
