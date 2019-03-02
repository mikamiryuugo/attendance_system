require 'test_helper'

class AttendanceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendance_index_url
    assert_response :success
  end

  test "should get create" do
    get attendance_create_url
    assert_response :success
  end

  test "should get edit" do
    get attendance_edit_url
    assert_response :success
  end

  test "should get update" do
    get attendance_update_url
    assert_response :success
  end

  test "should get destroy" do
    get attendance_destroy_url
    assert_response :success
  end

end
