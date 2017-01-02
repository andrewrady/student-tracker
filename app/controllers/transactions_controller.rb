class TransactionsController < ApplicationController
  layout 'student'
  autocomplete :products, :name, :full => true

  def index
    @transactions = Transaction.all
  end

  def new
   @product = Product.all
   @student = Student.where(user_id: current_user)
   @transaction = Transaction.new

  end

  def create
   @transaction = Transaction.new(transaction_params)

   if @transaction.save
     redirect_to root_path
   else 
     render 'new'
   end

  end



  private

    def transaction_params
      params.require(:transaction).permit(:name, :price, :student_id)
    end

end
