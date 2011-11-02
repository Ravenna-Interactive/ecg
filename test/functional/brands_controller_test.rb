require 'test_helper'

class BrandsControllerTest < ActionController::TestCase
  
  def setup
    login_as :quentin
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brand" do
    assert_difference('Brand.count') do
      post :create, :brand => { :name => "Happy Brand" }
    end

    assert_redirected_to brands_path
  end

  test "should show brand" do
    get :show, :id => brands(:gibson).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => brands(:gibson).to_param
    assert_response :success
  end

  test "should update brand" do
    put :update, :id => brands(:gibson).to_param, :brand => { }
    assert_redirected_to brands_path
  end

end
