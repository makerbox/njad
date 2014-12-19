require 'test_helper'

class AvailableDatesControllerTest < ActionController::TestCase
  setup do
    @available_date = available_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:available_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create available_date" do
    assert_difference('AvailableDate.count') do
      post :create, available_date: { avail: @available_date.avail, product_id: @available_date.product_id }
    end

    assert_redirected_to available_date_path(assigns(:available_date))
  end

  test "should show available_date" do
    get :show, id: @available_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @available_date
    assert_response :success
  end

  test "should update available_date" do
    patch :update, id: @available_date, available_date: { avail: @available_date.avail, product_id: @available_date.product_id }
    assert_redirected_to available_date_path(assigns(:available_date))
  end

  test "should destroy available_date" do
    assert_difference('AvailableDate.count', -1) do
      delete :destroy, id: @available_date
    end

    assert_redirected_to available_dates_path
  end
end
