class ApplicationController < ActionController::Base
    def main
        #render html: "123"
        #app/views/pages/main.html.erb
        #embedded ruby
    end

    def user_signed_in?
        session[:thankyou] != nil
    end

    def current_user
        if user_signed_in?
            User.find(session[:thankyou])
        else
            nil
        end
    end
    helper_method :user_signed_in?, :current_user
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_find

    private
    def record_not_find
        render file: "public/404.html", status: 404
    end

    def check_login!
        if not user_signed_in?
            redirect_to sign_in_users_path
        end
    end
end
