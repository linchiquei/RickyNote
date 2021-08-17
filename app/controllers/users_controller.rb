class UsersController < ApplicationController

    def sign_up
        @user = User.new
    end

    def sign_in
        @user = User.new
    end

    def profile
        #redirect_to '/users/sign_up'
    end

    def create
        #render html: params
        clear = user_params
        @user = User.new(clear)
        #byebug
        if(@user.save)
            redirect_to "/"
        else
            render :sign_up
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :account, :password, :password_confirmation)
    end
end
