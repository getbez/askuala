require 'test_helper'

class LearnedCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learned_course = learned_courses(:one)
  end

  test "should get index" do
    get learned_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_learned_course_url
    assert_response :success
  end

  test "should create learned_course" do
    assert_difference('LearnedCourse.count') do
      post learned_courses_url, params: { learned_course: { completion_level: @learned_course.completion_level, course_id: @learned_course.course_id, current_concept: @learned_course.current_concept, current_grade: @learned_course.current_grade, starting_level: @learned_course.starting_level, student_user_id: @learned_course.student_user_id } }
    end

    assert_redirected_to learned_course_url(LearnedCourse.last)
  end

  test "should show learned_course" do
    get learned_course_url(@learned_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_learned_course_url(@learned_course)
    assert_response :success
  end

  test "should update learned_course" do
    patch learned_course_url(@learned_course), params: { learned_course: { completion_level: @learned_course.completion_level, course_id: @learned_course.course_id, current_concept: @learned_course.current_concept, current_grade: @learned_course.current_grade, starting_level: @learned_course.starting_level, student_user_id: @learned_course.student_user_id } }
    assert_redirected_to learned_course_url(@learned_course)
  end

  test "should destroy learned_course" do
    assert_difference('LearnedCourse.count', -1) do
      delete learned_course_url(@learned_course)
    end

    assert_redirected_to learned_courses_url
  end
end
