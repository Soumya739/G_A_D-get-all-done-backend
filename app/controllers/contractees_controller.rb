class ContracteesController < ApplicationController
    def index
        contractees = Contractee.all
        render :json => contractees
    end

    def show
        contractee = Contractee.find(params[:id])
        render :json => contractee
    end

    def create
        contractee = Contractee.new(set_param)
        if contractee.save
            render :json => contractee
        end
    end

    private

    def set_param
        params.require(:contractee).permit(:user_id)
    end

end
