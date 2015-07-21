require 'test_helper'

class CourseAttachmentsControllerTest < ActionController::TestCase
  setup do
    @course_attachment = course_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_attachment" do
    assert_difference('CourseAttachment.count') do
      post :create, course_attachment: { course_id: @course_attachment.course_id, video: @course_attachment.video }
    end

    assert_redirected_to course_attachment_path(assigns(:course_attachment))
  end

  test "should show course_attachment" do
    get :show, id: @course_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_attachment
    assert_response :success
  end

  test "should update course_attachment" do
    patch :update, id: @course_attachment, course_attachment: { course_id: @course_attachment.course_id, video: @course_attachment.video }
    assert_redirected_to course_attachment_path(assigns(:course_attachment))
  end

  test "should destroy course_attachment" do
    assert_difference('CourseAttachment.count', -1) do
      delete :destroy, id: @course_attachment
    end

    assert_redirected_to course_attachments_path
  end
end
