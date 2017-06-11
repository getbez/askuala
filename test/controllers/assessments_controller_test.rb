require 'test_helper'

class AssessmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment = assessments(:one)
  end

  test "should get index" do
    get assessments_url
    assert_response :success
  end

  test "should get new" do
    get new_assessment_url
    assert_response :success
  end

  test "should create assessment" do
    assert_difference('Assessment.count') do
      post assessments_url, params: { assessment: { concept_id: @assessment.concept_id, level: @assessment.level, min_passing_grade: @assessment.min_passing_grade } }
    end

    assert_redirected_to assessment_url(Assessment.last)
  end

  test "should show assessment" do
    get assessment_url(@assessment)
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_url(@assessment)
    assert_response :success
  end

  test "should update assessment" do
    patch assessment_url(@assessment), params: { assessment: { concept_id: @assessment.concept_id, level: @assessment.level, min_passing_grade: @assessment.min_passing_grade } }
    assert_redirected_to assessment_url(@assessment)
  end

  test "should destroy assessment" do
    assert_difference('Assessment.count', -1) do
      delete assessment_url(@assessment)
    end

    assert_redirected_to assessments_url
  end
end
