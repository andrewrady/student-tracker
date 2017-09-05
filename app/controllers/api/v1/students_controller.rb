class Api::V1::StudentsController < ApplicationController
    respond_to :json
    #before_action :deny

	def deny
		redirect_to root_path unless user_signed_in?
	end

    def index
        @students = Student.where('user_id like ?', params[:user_id]).where('status like ?', '%active')
        render json: @students
    end

    def show
        @student = Student.where(:user_id=>params[:user_id]).where(:id=>params[:id])
        render json: @student
    end

    def create 
        @student = Student.new(student_params)

        if @student.save
            render json: @student, status: 201
        else
            render json: { errors: error.message }, status: 422
        end
    end

    def update
        @student = Student.where(:user_id=>params[:user_id]).where(:id=>params[:id]).first

        if @student.update(student_params)
            render json: @student, status: 201
        else
            render json: { errors: error.message }, state: 422
        end
    end

    def destroy
        @student = Student.where(:user_id=>params[:user_id]).where(:id=>params[:id]).first

        @student.destroy
        head 204 
    end

    private
        def student_params
            params.permit(:name, :address, :city, :state, :state, :zip, :status, :rank, :size, :trail, :phone, :age, :gender, :email, :slug, :user_id, :head_of_houses_id)
        end
end