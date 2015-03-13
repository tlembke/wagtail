require 'test_helper'

class MeasurevaluesControllerTest < ActionController::TestCase
  setup do
    @measurevalue = measurevalues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:measurevalues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create measurevalue" do
    assert_difference('Measurevalue.count') do
      post :create, measurevalue: { created_by: @measurevalue.created_by, measure_id: @measurevalue.measure_id, person_id: @measurevalue.person_id, value: @measurevalue.value, value_date: @measurevalue.value_date }
    end

    assert_redirected_to measurevalue_path(assigns(:measurevalue))
  end

  test "should show measurevalue" do
    get :show, id: @measurevalue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @measurevalue
    assert_response :success
  end

  test "should update measurevalue" do
    patch :update, id: @measurevalue, measurevalue: { created_by: @measurevalue.created_by, measure_id: @measurevalue.measure_id, person_id: @measurevalue.person_id, value: @measurevalue.value, value_date: @measurevalue.value_date }
    assert_redirected_to measurevalue_path(assigns(:measurevalue))
  end

  test "should destroy measurevalue" do
    assert_difference('Measurevalue.count', -1) do
      delete :destroy, id: @measurevalue
    end

    assert_redirected_to measurevalues_path
  end
end
