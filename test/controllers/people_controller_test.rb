require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { address_line: @person.address_line, address_line_2: @person.address_line_2, created_by: @person.created_by, dob: @person.dob, dva: @person.dva, family_name: @person.family_name, given_names: @person.given_names, ihi: @person.ihi, known_as: @person.known_as, phone: @person.phone, postcode: @person.postcode, sex: @person.sex, state: @person.state, town: @person.town }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, person: { address_line: @person.address_line, address_line_2: @person.address_line_2, created_by: @person.created_by, dob: @person.dob, dva: @person.dva, family_name: @person.family_name, given_names: @person.given_names, ihi: @person.ihi, known_as: @person.known_as, phone: @person.phone, postcode: @person.postcode, sex: @person.sex, state: @person.state, town: @person.town }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
