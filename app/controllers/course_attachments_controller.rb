class CourseAttachmentsController < ApplicationController
  before_action :set_course_attachment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @course_attachments = CourseAttachment.all
    respond_with(@course_attachments)
  end

  def show
    respond_with(@course_attachment)
  end

  def new
    @course_attachment = CourseAttachment.new
    respond_with(@course_attachment)
  end

  def edit
  end

  def create
    @course_attachment = CourseAttachment.new(course_attachment_params)
    @course_attachment.save
    respond_with(@course_attachment)
  end

  def update
    @course_attachment.update(course_attachment_params)
    respond_with(@course_attachment)
  end

  def destroy
    @course_attachment.destroy
    respond_with(@course_attachment.course)
  end

  private
    def set_course_attachment
      @course_attachment = CourseAttachment.find(params[:id])
    end

    def course_attachment_params
      params.require(:course_attachment).permit(:course_id, :video)
    end
end
