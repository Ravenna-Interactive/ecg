require 'test_helper'

class BannersControllerTest < ActionController::TestCase
  
  def setup
    login_as :quentin
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banner" do
    assert_difference('Banner.count') do
      post :create, :banner => { }
    end

    assert_redirected_to banners_path
  end

  test "should get edit" do
    get :edit, :id => banners(:one).to_param
    assert_response :success
  end

  test "should update banner" do
    put :update, :id => banners(:one).to_param, :banner => { }
    assert_redirected_to banners_path
  end

  test "should destroy banner" do
    assert_difference('Banner.count', -1) do
      delete :destroy, :id => banners(:one).to_param
    end

    assert_redirected_to banners_path
  end
end
