require 'minitest/autorun'
require_relative '../code/learning_path'

class TestLearningPath < MiniTest::Unit::TestCase
  def test_result_class
    learning_path = LearningPath.new('test_data/domain_order_test.csv', 'test_data/student_tests_test.csv')   
    student = Student.new(learning_path.results.first)

    assert_equal Hash, student.result.class
  end 

  def test_name
    student = Student.new({ "Student Name" => 'John', "RF" => 'K', 'RL' => 'K', 'RI' => 'K'})

    assert_equal 'John', student.name
  end

  def test_learning_path_for_student_with_no_score
    student = Student.new({ "Student Name" => 'John' })
    domains = { "K" => ['RF', 'RL', 'RI'], "1" => ['RI', 'RF', 'RL'] }

    assert_equal ["K.RF", "K.RL", "K.RI", "1.RI", "1.RF", "1.RL"], student.learning_path(domains)
  end

  def test_learning_path_for_student_with_all_K_grade_score
    student = Student.new({ "Student Name" => 'John', "RF" => 'K', 'RL' => 'K', 'RI' => 'K' })
    domains = { "K" => ['RF', 'RL', 'RI'], "1" => ['RI', 'RF', 'RL'] }

    assert_equal ["K.RF", "K.RL", "K.RI", "1.RI", "1.RF", "1.RL"], student.learning_path(domains)
  end 

  def test_learning_path_for_student_with_one_K_grade_score
    student = Student.new({ "Student Name" => 'John', "RF" => 'K', 'RL' => '1', 'RI' => '1' })
    domains = { "K" => ['RF', 'RL', 'RI'], "1" => ['RI', 'RF', 'RL'] }

    assert_equal ["K.RF", "1.RI", "1.RF", "1.RL"], student.learning_path(domains)
  end

  def test_learning_path_for_student_with_more_than_one_K_grade_score
    student = Student.new({ "Student Name" => 'John', "RF" => 'K', 'RL' => 'K', 'RI' => '1' })
    domains = { "K" => ['RF', 'RL', 'RI'], "1" => ['RI', 'RF', 'RL'] }

    assert_equal ["K.RF", "K.RL", "1.RI", "1.RF", "1.RL"], student.learning_path(domains)
  end

  def test_learning_path_for_student_with_all_1_grade_score
    student = Student.new({ "Student Name" => 'John', "RF" => '1', 'RL' => '1', 'RI' => '1' })
    domains = { "K" => ['RF', 'RL', 'RI'], "1" => ['RI', 'RF', 'RL'] }

    assert_equal ["1.RI", "1.RF", "1.RL"], student.learning_path(domains)
  end

  def test_learning_path_for_student_with_new_course_only_in_K_grade_score
    student = Student.new({ "Student Name" => 'John', "RF" => '1', 'RL' => '1', 'RI' => '1', 'L' => 'K' })
    domains = { "K" => ['RF', 'RL', 'RI', 'L'], "1" => ['RI', 'RF', 'RL'] }

    assert_equal ["K.L", "1.RI", "1.RF", "1.RL"], student.learning_path(domains)
  end

  def test_learning_path_for_student_with_new_course_only_in_1_grade_score
    student = Student.new({ "Student Name" => 'John', "RF" => '1', 'RL' => '1', 'RI' => '1', 'L' => '1' })
    domains = { "K" => ['RF', 'RL', 'RI'], "1" => ['RI', 'RF', 'RL', 'L'] }

    assert_equal ["1.RI", "1.RF", "1.RL", "1.L"], student.learning_path(domains)
  end
end
