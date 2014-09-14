
require 'pry'

scores = [75, 100, 85, 65, 84, 87, 95]

# print out the average score, the lowest score, and the max score

# YOUR CODE GOES HERE

def gradeAVG(scores)
  sum = 0
  scores.each do |grade|
    sum += grade
  end
  average = sum / (scores.length)
  return average
end

def highest_grade(scores)
  max = 0
  scores.each do |grade|
    if grade > max
    max = grade
    end
  end
  return max
end

def lowestGrade(scores, average)
  lowest = average
  scores.each do |grade|
    if grade < average
    lowest = grade
    end
  end
  lowest
end


def grade_report(scores)
  average = gradeAVG(scores)
  highest = highest_grade(scores)
  lowest = lowestGrade(scores, average)

  puts "The average grade was : #{"%.2f" % average}"
  puts "The HIGHEST grade was : #{"%.2f" % highest}"
  puts "The Lowest grade was : #{"%.2f" % lowest}"
end

grade_report(scores)





