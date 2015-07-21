class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html
  
  def sales
    @orders = Order.all.where(teacher: current_user).order("created_at DESC")
    @course = Course.where(params[:course_id])
  end
  
  def purchases
    @orders = Order.all.where(student: current_user).order("created_at DESC")
  end

  def new
    @order = Order.new
    @course = Course.find(params[:course_id])
    respond_with(@order)
  end

  

  def create
    @order = Order.new(order_params)
    @course = Course.find(params[:course_id])
    @teacher = @course.user
    @order.course_id = @course.id
    @order.student_id = current_user.id
    @order.teacher_id = @teacher.id
    @order.save
    flash[:success] = "order was created succesfully!"
    respond_with @course
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end
