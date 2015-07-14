require 'csv'
require_relative '../code/student'

class LearningPath
  attr_reader :domains, :results

  def initialize(domains, results)
    @domains = CSV.read(domains, { skip_blanks: true })
    @results = CSV.read(results, { headers: true, skip_blanks: true })
  end

  # show learning paths in CSV file
  def parse
    CSV.open("../solution.csv", "w") do |csv|
      results.each do |result|
        student = Student.new(result)
        
        csv << [student.name].concat(student.learning_path(hashed_domains).take(5))
      end
    end
  end

  # Convert @domains to hash
  def hashed_domains
    h_domains = {}

    domains.each{ |domain_row| h_domains[domain_row.first] = domain_row[1..-1] }

    h_domains
  end  
end