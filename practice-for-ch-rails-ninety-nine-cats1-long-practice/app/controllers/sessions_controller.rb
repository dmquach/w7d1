class SessionsController < ApplicationController
    def new
        if logged_in?
            redirect_to cats_url
        else
            render :new
        end
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        # @user = 

        if @user
            login!(@user)
            redirect_to cats_url
        else
            render :new
        end
    end

    def destroy
        # debugger
        log_out!
        redirect_to new_session_url
    end

end
