class CategoriesController < ApplicationController
    
    def index
        @categories = Category.all
        @development = @categories[0]
        @business = @categories[1]
        @itsoftware = @categories[2]
        @office_productivity = @categories[3]
        @personal_development = @categories[4]
        @design = @categories[5]
        @marketing = @categories[6]
        @lifestyle = @categories[7]
        @photography = @categories[8]
        @health_fitness = @categories[9]
        @teacher_training = @categories[10]
        @music = @categories[11]
        @academics = @categories[12]
        @language = @categories[13]
    end
    
    def show
       @courses = Course.where(category_id: params[:id]) 
    end
    
end