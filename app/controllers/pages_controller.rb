class PagesController < ApplicationController
    
    def index
        redirect_to courses_path if user_signed_in?
    end
end
