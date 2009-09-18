require 'test_helper'

class VisitorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitor" do
    assert_difference('Visitor.count') do
      post :create, :visitor => { }
    end

    assert_redirected_to visitor_path(assigns(:visitor))
  end

  test "should show visitor" do
    get :show, :id => visitors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => visitors(:one).to_param
    assert_response :success
  end

  test "should update visitor" do
    put :update, :id => visitors(:one).to_param, :visitor => { }
    assert_redirected_to visitor_path(assigns(:visitor))
  end

  test "should destroy visitor" do
    assert_difference('Visitor.count', -1) do
      delete :destroy, :id => visitors(:one).to_param
    end

    assert_redirected_to visitors_path
  end
end
