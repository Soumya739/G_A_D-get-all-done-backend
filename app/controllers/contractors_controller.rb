class ContractorsController < ApplicationController
    def index
        contractors = Contractor.all
        render :json => contractors
    end

    def show
        contractor = Contractor.find(params[:id])
        render :json => contractor
    end

    def create
        contractor = Contractor.new(set_param)
        if contractor.save
            render :json => contractor
        end
    end

    private

    def set_param
        params.require(:contractor).permit(:user_id, :services, :projects_completed)
    end
end
