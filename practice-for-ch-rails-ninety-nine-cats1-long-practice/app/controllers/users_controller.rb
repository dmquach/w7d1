class UsersController < ApplicationController
    def new
        if logged_in?
            redirect_to cats_url
        else
            render :new
        end
    end

    def create
        @user = User.new(user_params)
        # debugger

        if @user.save!
            login!(@user)
            redirect_to cats_url
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
