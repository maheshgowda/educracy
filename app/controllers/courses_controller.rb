class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:teaching, :new, :create, :edit, :update]
  before_action :check_user, only: [:edit, :update]
  
  respond_to :html
   
  def teaching
    @courses = Course.paginate(:page => params[:page], per_page: 4).order('created_at DESC')
    @reviews = Review.where(params[:course_id])
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating=@reviews.average(:rating).round(5)
    end
  end
  
  def index
    @courses = Course.all.order("created_at DESC")
    @courses = Course.paginate(:page => params[:page], per_page: 4).order('created_at DESC')
    @reviews = Review.where(params[:id])
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating=@reviews.average(:rating).round(5)
    end
    respond_with(@courses)
  end

  def show
     @course_attachments = @course.course_attachments.all
    @reviews = Review.where(course_id: @course.id)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating=@reviews.average(:rating).round(5)
    end
  end

  def new
    @course = Course.new
     @course_attachments = @course.course_attachments.build
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    if @course.save
      params[:course_attachments]['video'].each do |a|
          @course_attachment = @course.course_attachments.create!(:video => a)
       end
       respond_with(@course)
    else
       render :new
    end
  end

  def update
    @course.update(course_params)
    if @course.save
     respond_with(@course)
    else
     render :edit
    end
  end

  def destroy
    @course.destroy
    respond_with(@course)
  end
  
  def search
    @courses = Course.search(params)
    if @courses.blank?
      flash[:notice] = "No result found"
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :price, :lecture, :image, :category_id, course_attachments_attributes: [:id, :course_id, :video])
    end
    
    def check_user
      if current_user != @course.user
        redirect_to root_url, alert: "sorry this course is not belongs to you"
      end
    end
end
