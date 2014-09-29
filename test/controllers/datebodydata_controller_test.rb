require 'test_helper'

class DatebodydataControllerTest < ActionController::TestCase
  setup do
    @datebodydatum = datebodydata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datebodydata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datebodydatum" do
    assert_difference('Datebodydatum.count') do
      post :create, datebodydatum: {  }
    end

    assert_redirected_to datebodydatum_path(assigns(:datebodydatum))
  end

  test "should show datebodydatum" do
    get :show, id: @datebodydatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @datebodydatum
    assert_response :success
  end

  test "should update datebodydatum" do
    patch :update, id: @datebodydatum, datebodydatum: {  }
    assert_redirected_to datebodydatum_path(assigns(:datebodydatum))
  end

  test "should destroy datebodydatum" do
    assert_difference('Datebodydatum.count', -1) do
      delete :destroy, id: @datebodydatum
    end

    assert_redirected_to datebodydata_path
  end
end
