require 'test_helper'

class WorkshopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workshop = workshops(:one)
  end

  test "should get index" do
    get workshops_url
    assert_response :success
  end

  test "should get new" do
    get new_workshop_url
    assert_response :success
  end

  test "should create workshop" do
    assert_difference('Workshop.count') do
      post workshops_url, params: { workshop: { available_on: @workshop.available_on, capacity: @workshop.capacity, category_id: @workshop.category_id, cost: @workshop.cost, desctiption: @workshop.desctiption, discontinue_on: @workshop.discontinue_on, finish: @workshop.finish, meta_description: @workshop.meta_description, meta_keyworlds: @workshop.meta_keyworlds, meta_title: @workshop.meta_title, price: @workshop.price, slung: @workshop.slung, start: @workshop.start, teacher_id: @workshop.teacher_id, title: @workshop.title } }
    end

    assert_redirected_to workshop_url(Workshop.last)
  end

  test "should show workshop" do
    get workshop_url(@workshop)
    assert_response :success
  end

  test "should get edit" do
    get edit_workshop_url(@workshop)
    assert_response :success
  end

  test "should update workshop" do
    patch workshop_url(@workshop), params: { workshop: { available_on: @workshop.available_on, capacity: @workshop.capacity, category_id: @workshop.category_id, cost: @workshop.cost, desctiption: @workshop.desctiption, discontinue_on: @workshop.discontinue_on, finish: @workshop.finish, meta_description: @workshop.meta_description, meta_keyworlds: @workshop.meta_keyworlds, meta_title: @workshop.meta_title, price: @workshop.price, slung: @workshop.slung, start: @workshop.start, teacher_id: @workshop.teacher_id, title: @workshop.title } }
    assert_redirected_to workshop_url(@workshop)
  end

  test "should destroy workshop" do
    assert_difference('Workshop.count', -1) do
      delete workshop_url(@workshop)
    end

    assert_redirected_to workshops_url
  end
end
