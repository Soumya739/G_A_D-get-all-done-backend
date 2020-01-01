class UsersController < ApplicationController
    def index
        users = User.all
        render :json => users
    end

    def show
        user = User.find(params[:id])
        render :json => user
    end

    def create
        user = User.new(set_param)
        if user.save
            render :json => user
        end
    end

    private

    def set_param
        puts(params)
        params.require(:user).permit(:username, :email, :city, :country, :phone, :contractor, :contractee)
    end
end
