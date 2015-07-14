require 'minitest/autorun'
require_relative '../code/learning_path'

class TestLearningPath < MiniTest::Unit::TestCase
  def setup
    @learning_path = LearningPath.new('test_data/domain_order_test.csv', 'test_data/student_tests_test.csv')
  end

  def test_hashed_domains
    domains = {"K"=>["RF", "RL", "RI"], "1"=>["RI", "RF", "RL"], "2"=>["RF", "RI", "RL", "L"]}

    assert_equal domains, @learning_path.hashed_domains
  end  
end