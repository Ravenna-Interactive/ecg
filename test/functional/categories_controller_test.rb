require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    login_as :quentin
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, :category => { :name => 'Happy Little Category', :url_name => 'happy' }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, :id => categories(:electric).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => categories(:electric).to_param
    assert_response :success
  end

  test "should update category" do
    put :update, :id => categories(:electric).to_param, :category => { :name => "Awesome" }
    assert_redirected_to category_path(assigns(:category))
  end

end
