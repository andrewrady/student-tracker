class Api::V1::ContractsController < ApplicationController
    respond_to :json
    
    def index
        @contract = HeadOfHouse.where(:user_id=>params[:user_id])
        render json: @contract, :include => [:students]
    end

    def show
        @contract = HeadOfHouse.where(:user_id=>params[:user_id]).where(:id=>params[:id])
        render json: @contract, :include => [:students]
    end

    def create
        @contract = HeadOfHouse.new(contract_params)

        if @contract.save
            render json: @contract, status: 201
        else
            render json: { errors: error.message }, status: 422
        end
    end

    def update
        @contract = HeadOfHouse.where(:user_id=>params[:user_id]).where(:id=>params[:id]).first

        if @contract.update(contract_params)
            render json: @contract, status: 201
        else
            render json: { error: error.message }, status: 422
        end
    end

    def destroy
        @contract = HeadOfHouse.where(:user_id=>params[:user_id]).where(:id=>params[:id]).first
        @contract.destroy
        head 204

    end

    private
        def contract_params
            params.permit(:name, :amount, :user_id, :head_of_house_id)
        end
end