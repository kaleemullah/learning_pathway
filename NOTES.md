- Ruby Version: 2.1.2p95

- To run the code, Please switch to the **code** directory:

    $ ruby output.rb

 This will populate **solutions.csv** with learning path for all students.

- Code Details:
  - *output.rb*: Its just used for invoking a method to write output in csv file.
  - *learning_path.rb*: Its for parsing *domain_order.csv* and *student_tests.csv* and writing learning path for all students in *solution.csv* file.
  - student.rb: It processes a single student's test result and inform about his learning path.
    
- I've used **minitest** for test cases. 

  Minitest: https://github.com/seattlerb/minitest#install
 
 To review and run the test case, please switch to the **test** directory:
 
 $ ruby student_test.rb

 Thank you :)