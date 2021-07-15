class SessionsController < ApplicationController

    def new 
    end 

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id #keeps user logged in, by storing info in session
            flash[:success] = 'logged in successfully'
            redirect_to root_path
        else
            flash.now[:error] = 'There was something wrong with your log in details'
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = 'You have successfully logged out'
        redirect_to login_path
    end 
end
