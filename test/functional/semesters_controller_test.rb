require 'test_helper'

class SemestersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:semesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create semester" do
    assert_difference('Semester.count') do
      post :create, :semester => { }
    end

    assert_redirected_to semester_path(assigns(:semester))
  end

  test "should show semester" do
    get :show, :id => semesters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => semesters(:one).to_param
    assert_response :success
  end

  test "should update semester" do
    put :update, :id => semesters(:one).to_param, :semester => { }
    assert_redirected_to semester_path(assigns(:semester))
  end

  test "should destroy semester" do
    assert_difference('Semester.count', -1) do
      delete :destroy, :id => semesters(:one).to_param
    end

    assert_redirected_to semesters_path
  end
end
