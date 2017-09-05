class Api::V1::ContractsController < ApplicationController
    respond_to :json
    
    def index
        @contract = HeadOfHouse.where(:user_id=>params[:user_id])
        render json: @contract, :include => [:students]
    end
end