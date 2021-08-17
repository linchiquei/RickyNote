class SessionsController < ApplicationController
    def create
        pw = user_params[:password]
        salt_pw = "zyx#{pw}"
        hash = Digest::SHA1.hexdigest(salt_pw)

        user = User.find_by(email: user_params[:email],
        password: hash)

        if user
            session[:thankyou] = user.id
            redirect_to '/'
        else
            redirect_to '/users/sign_in'
        end
    end

    def destory
        session[:thankyou] = nil
        redirect_to '/'
    end

    private
    def user_params
        params.require(:user).permit(:email, :password,)
    end

    #cookies seesions
end