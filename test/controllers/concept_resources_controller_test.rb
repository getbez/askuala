require 'test_helper'

class ConceptResourcesControllerTest < ActionController::TestCase
  setup do
    @concept_resource = concept_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concept_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concept_resource" do
    assert_difference('ConceptResource.count') do
      post :create, concept_resource: { concept_id: @concept_resource.concept_id, content: @concept_resource.content, file_name: @concept_resource.file_name, format: @concept_resource.format, level: @concept_resource.level, content_type: @concept_resource.content_type, presentation_mode: @concept_resource.presentation_mode, resource_type: @concept_resource.resource_type }
    end

    assert_redirected_to concept_resource_path(assigns(:concept_resource))
  end

  test "should show concept_resource" do
    get :show, id: @concept_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concept_resource
    assert_response :success
  end

  test "should update concept_resource" do
    patch :update, id: @concept_resource, concept_resource: { concept_id: @concept_resource.concept_id, content: @concept_resource.content, file_name: @concept_resource.file_name, format: @concept_resource.format, level: @concept_resource.level, content_type: @concept_resource.content_type, presentation_mode: @concept_resource.presentation_mode, resource_type: @concept_resource.resource_type }
    assert_redirected_to concept_resource_path(assigns(:concept_resource))
  end

  test "should destroy concept_resource" do
    assert_difference('ConceptResource.count', -1) do
      delete :destroy, id: @concept_resource
    end

    assert_redirected_to concept_resources_path
  end
end
