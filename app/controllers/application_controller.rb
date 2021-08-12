class ApplicationController < ActionController::Base
    def main
        #render html: "123"
        #app/views/pages/main.html.erb
        #embedded ruby
    end

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_find

    private
    def record_not_find
        render file: "public/404.html", status: 404
    end
end
