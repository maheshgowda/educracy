class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_course
  before_action :authenticate_user!

  respond_to :html
  
  
  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @user = current_user
    @review = @user.reviews.new(review_params)
    @review.user_id = current_user.id
    @review.course_id = @course.id
    if @review.save
      redirect_to @course
    else
      render :new
    end
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end
    
    def set_course
      @course = Course.find(params[:course_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
