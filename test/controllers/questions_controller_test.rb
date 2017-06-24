require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get new" do
    get new_question_url
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { answer: @question.answer, assessment_id: @question.assessment_id, average_time: @question.average_time, difficulty_level_id: @question.difficulty_level_id, question_string: @question.question_string, question_type: @question.question_type, target_concept: @question.target_concept } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_url(@question)
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { answer: @question.answer, assessment_id: @question.assessment_id, average_time: @question.average_time, difficulty_level_id: @question.difficulty_level_id, question_string: @question.question_string, question_type: @question.question_type, target_concept: @question.target_concept } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to questions_url
  end
end
