class Student
  attr_reader :result

  def initialize(result)
    @result = result.to_hash
  end

  def name
    result['Student Name']
  end 

  # Learning path for each student
  def learning_path(domains_with_grade)
    path = {}

    domains_with_grade.each_pair do |grade, domains|
      # select particular domain if grade matches in test score OR select for higher grade OR if no score exists in test result
      path[grade] = domains.select{ |domain| same_grade?(grade, domain) || path.values.flatten.include?(domain) || no_score?(domain) }
    end

    # format path i.e K.RF, K.RI
    format_learning_path(path)
  end

  def same_grade?(grade, domain)
    result[domain] == grade
  end
    
  def no_score?(domain)
    result[domain].nil?
  end

  # input: {"K"=>["RI"], "1"=>["RI"]}
  # output: ["K.RI", "1.RI"]
  def format_learning_path(path)
    path.collect{ |grade, domains| domains.collect{|domain| "#{grade}.#{domain}" } }.flatten
  end
end