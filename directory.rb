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

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

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

  while !name.empty? && !cohort.empty? do
    @students << {name: name, cohort: cohort}
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    elsif @students.count == 1
      puts "Now we have #{@students.count} student"
    end
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    name = gets.gsub("\n", "")
    puts "Please enter the cohort of the students"
    puts "To finish, just hit return twice"
    cohort = gets.gsub("\n", "")
  end

end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  puts "Students beginning with which letter?"
  first_letter = gets.gsub("\n", "")
  first_letter.upcase!

  @students.each.with_index(1) do |student, index|
    if student[:name].slice(0) == first_letter && student[:name].length < 12
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
    end
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(40)
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(40)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
#nothing happens until we call the methods
interactive_menu
#students = input_students
#print_header
#print(students)
#print_footer(students)
