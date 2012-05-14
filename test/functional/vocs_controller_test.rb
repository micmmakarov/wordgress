require 'test_helper'

class VocsControllerTest < ActionController::TestCase
  setup do
    @voc = vocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voc" do
    assert_difference('Voc.count') do
      post :create, voc: { user_id: @voc.user_id, word_id: @voc.word_id }
    end

    assert_redirected_to voc_path(assigns(:voc))
  end

  test "should show voc" do
    get :show, id: @voc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voc
    assert_response :success
  end

  test "should update voc" do
    put :update, id: @voc, voc: { user_id: @voc.user_id, word_id: @voc.word_id }
    assert_redirected_to voc_path(assigns(:voc))
  end

  test "should destroy voc" do
    assert_difference('Voc.count', -1) do
      delete :destroy, id: @voc
    end

    assert_redirected_to vocs_path
  end
end
