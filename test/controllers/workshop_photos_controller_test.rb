require 'test_helper'

class WorkshopPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workshop_photo = workshop_photos(:one)
  end

  test "should get index" do
    get workshop_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_workshop_photo_url
    assert_response :success
  end

  test "should create workshop_photo" do
    assert_difference('WorkshopPhoto.count') do
      post workshop_photos_url, params: { workshop_photo: { photo: @workshop_photo.photo, workshop_id: @workshop_photo.workshop_id } }
    end

    assert_redirected_to workshop_photo_url(WorkshopPhoto.last)
  end

  test "should show workshop_photo" do
    get workshop_photo_url(@workshop_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_workshop_photo_url(@workshop_photo)
    assert_response :success
  end

  test "should update workshop_photo" do
    patch workshop_photo_url(@workshop_photo), params: { workshop_photo: { photo: @workshop_photo.photo, workshop_id: @workshop_photo.workshop_id } }
    assert_redirected_to workshop_photo_url(@workshop_photo)
  end

  test "should destroy workshop_photo" do
    assert_difference('WorkshopPhoto.count', -1) do
      delete workshop_photo_url(@workshop_photo)
    end

    assert_redirected_to workshop_photos_url
  end
end
