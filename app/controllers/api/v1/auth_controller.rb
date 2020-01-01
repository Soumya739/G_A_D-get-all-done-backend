class Api::V1::AuthController < ApplicationController

    def create
        
      user = User.find_by(email: params[:email])
      if user
        if params[:loginAs] === "contractor"
            contractor = Contractor.find_by(user_id: user.id)
            if contractor && contractor.authenticate(params[:password])
                # issue that user a token\
                token = issue_token(contractor, "contractor")
                render json: {id: contractor.id, email: user.email, jwt: token}
            else
                render json: {error: 'Contractor could not be found'}, status: 401
            end
        elsif params[:loginAs] === "contractee"
            contractee = Contractee.find_by(user_id: user.id)
            if contractee && contractee.authenticate(params[:password])
                # issue that user a token\
                token = issue_token(contractee, "contractee")
                render json: {id: contractee.id, email: user.email, jwt: token}
            else
                render json: {error: 'Contractee could not be found'}, status: 401
            end
        end
      else
        render json: {error: 'User could not be found'}, status: 401
    end
  
    def show
      user = User.find_by(id: user_id)
      if logged_in?
        render json: { id: user.id, username: user.username }
      else
        render json: {error: 'No user could be found'}, status: 401
      end
    end

end