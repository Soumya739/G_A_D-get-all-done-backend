class Api::V1::AuthController < ApplicationController

    def create
      user = User.find_by(email: params[:email], "#{params[:loginAs]}": true)
      if user && user.authenticate(params[:password])
        token = issue_token(user)
        render json: {username: user.username,email: user.email, jwt: token}
      else
        render json: {error: 'User or password could not be matched'}, status: 401
      end
    end
  
    def show
      user = User.find_by(id: user_id)
      if logged_in?
        type = user.contractor? "contractor": "contractee"
        render json: { type: type, username: user.username }
      else
        render json: {error: 'No user could be found'}, status: 401
      end
    end

end