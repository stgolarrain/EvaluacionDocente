require 'test_helper'

class AcademicUnitsControllerTest < ActionController::TestCase
  setup do
    @academic_unit = academic_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:academic_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create academic_unit" do
    assert_difference('AcademicUnit.count') do
      post :create, academic_unit: { name: @academic_unit.name }
    end

    assert_redirected_to academic_unit_path(assigns(:academic_unit))
  end

  test "should show academic_unit" do
    get :show, id: @academic_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @academic_unit
    assert_response :success
  end

  test "should update academic_unit" do
    patch :update, id: @academic_unit, academic_unit: { name: @academic_unit.name }
    assert_redirected_to academic_unit_path(assigns(:academic_unit))
  end

  test "should destroy academic_unit" do
    assert_difference('AcademicUnit.count', -1) do
      delete :destroy, id: @academic_unit
    end

    assert_redirected_to academic_units_path
  end
end
