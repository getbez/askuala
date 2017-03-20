require 'test_helper'

class LearnedConceptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learned_concept = learned_concepts(:one)
  end

  test "should get index" do
    get learned_concepts_url
    assert_response :success
  end

  test "should get new" do
    get new_learned_concept_url
    assert_response :success
  end

  test "should create learned_concept" do
    assert_difference('LearnedConcept.count') do
      post learned_concepts_url, params: { learned_concept: { completed: @learned_concept.completed, concept_id: @learned_concept.concept_id, end_time: @learned_concept.end_time, resource_id: @learned_concept.resource_id, start_time: @learned_concept.start_time } }
    end

    assert_redirected_to learned_concept_url(LearnedConcept.last)
  end

  test "should show learned_concept" do
    get learned_concept_url(@learned_concept)
    assert_response :success
  end

  test "should get edit" do
    get edit_learned_concept_url(@learned_concept)
    assert_response :success
  end

  test "should update learned_concept" do
    patch learned_concept_url(@learned_concept), params: { learned_concept: { completed: @learned_concept.completed, concept_id: @learned_concept.concept_id, end_time: @learned_concept.end_time, resource_id: @learned_concept.resource_id, start_time: @learned_concept.start_time } }
    assert_redirected_to learned_concept_url(@learned_concept)
  end

  test "should destroy learned_concept" do
    assert_difference('LearnedConcept.count', -1) do
      delete learned_concept_url(@learned_concept)
    end

    assert_redirected_to learned_concepts_url
  end
end
