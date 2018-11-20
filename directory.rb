# Let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: :villainy},
  {name: "Darth Vader", cohort: :november, hobbies: :villainy},
  {name: "Nurse Ratchet", cohort: :november, hobbies: :villainy},
  {name: "Michael Corleone", cohort: :november, hobbies: :villainy},
  {name: "Alex DeLarge", cohort: :november, hobbies: :villainy},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: :villainy},
  {name: "Terminator", cohort: :november, hobbies: :villainy},
  {name: "Freddy Krueger", cohort: :november, hobbies: :villainy},
  {name: "The Joker", cohort: :november, hobbies: :villainy},
  {name: "Joffrey Baratheon", cohort: :november, hobbies: :villainy},
  {name: "Norman Bates", cohort: :november, hobbies: :villainy}
]

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.gsub("\n", "")

  puts "Please enter the cohort of the students"
  puts "To finish, just hit return twice"
  cohort = gets.gsub("\n", "")
  cohort.intern
  cohort = "november" if cohort.empty?

  while !name.empty? do
    students << {name: name, cohort: cohort}
    if students.count > 1
      puts "Now we have #{students.count} students"
    elsif students.count == 1
      puts "Now we have #{students.count} student"
    end
    name = gets.gsub("\n", "")
    cohort = gets.gsub("\n", "")
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "Students beginning with which letter?"
  first_letter = gets.gsub("\n", "")
  first_letter.upcase!

  students.each.with_index(1) do |student, index|
    if student[:name].slice(0) == first_letter && student[:name].length < 12
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
    end
  end
end

def print_footer(students)
  if students.count > 1
    puts "Overall, we have #{students.count} great students".center(40)
  elsif students.count == 1
    puts "Overall, we have #{students.count} great student".center(40)
  end
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
