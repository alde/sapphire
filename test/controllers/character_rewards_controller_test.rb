require 'test_helper'

class CharacterRewardsControllerTest < ActionController::TestCase
  setup do
    @character_reward = character_rewards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_rewards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_reward" do
    assert_difference('CharacterReward.count') do
      post :create, character_reward: {  }
    end

    assert_redirected_to character_reward_path(assigns(:character_reward))
  end

  test "should show character_reward" do
    get :show, id: @character_reward
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character_reward
    assert_response :success
  end

  test "should update character_reward" do
    patch :update, id: @character_reward, character_reward: {  }
    assert_redirected_to character_reward_path(assigns(:character_reward))
  end

  test "should destroy character_reward" do
    assert_difference('CharacterReward.count', -1) do
      delete :destroy, id: @character_reward
    end

    assert_redirected_to character_rewards_path
  end
end
