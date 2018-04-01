require 'test_helper'

class EssaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @essay = essays(:one)
  end

  test "should get index" do
    get essays_url
    assert_response :success
  end

  test "should get new" do
    get new_essay_url
    assert_response :success
  end

  test "should create essay" do
    assert_difference('Essay.count') do
      post essays_url, params: { essay: { assignment_id: @essay.assignment_id } }
    end

    assert_redirected_to essay_url(Essay.last)
  end

  test "should show essay" do
    get essay_url(@essay)
    assert_response :success
  end

  test "should get edit" do
    get edit_essay_url(@essay)
    assert_response :success
  end

  test "should update essay" do
    patch essay_url(@essay), params: { essay: { assignment_id: @essay.assignment_id } }
    assert_redirected_to essay_url(@essay)
  end

  test "should destroy essay" do
    assert_difference('Essay.count', -1) do
      delete essay_url(@essay)
    end

    assert_redirected_to essays_url
  end
end
