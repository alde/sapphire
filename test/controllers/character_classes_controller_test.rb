require 'test_helper'

class CharacterClassesControllerTest < ActionController::TestCase
  setup do
    @character_class = character_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_class" do
    assert_difference('CharacterClass.count') do
      post :create, character_class: {  }
    end

    assert_redirected_to character_class_path(assigns(:character_class))
  end

  test "should show character_class" do
    get :show, id: @character_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character_class
    assert_response :success
  end

  test "should update character_class" do
    patch :update, id: @character_class, character_class: {  }
    assert_redirected_to character_class_path(assigns(:character_class))
  end

  test "should destroy character_class" do
    assert_difference('CharacterClass.count', -1) do
      delete :destroy, id: @character_class
    end

    assert_redirected_to character_classes_path
  end
end
