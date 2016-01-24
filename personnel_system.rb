class Employee
	def initialize(name,role,location)
		@name = name
		@role = role
		@location = location
	end
	def name
		@name
	end
	def role
		@role
	end
	def location
		@location
	end
	def transfer(new_location)
		@location = new_location
	end
end

directory = []

def main_menu(directory)
	puts "Main Menu"
	puts "------------------"
	puts "Please choose from the following options:"
	puts "1. Create a new employee record"
	puts "2. View or modify an employee record"
	puts "3. Exit."
	ans = gets.chomp.to_i
	if ans == 1
		new_record(directory)
	elsif ans == 2
		view_record(directory)
	elsif ans == 3
		system "cls"
		exit(directory)
	else		
		puts "Invalid answer. Please try again."
		main_menu(directory)
	end
end

def new_record(directory)
	puts "Create a New Employee Record"
	puts "-----------------------------"
	puts "Full Name?"
	emp_name = gets.chomp
	puts "Role?"
	emp_role = gets.chomp
	puts "Location?"
	emp_location = gets.chomp
	active_record = Employee.new(emp_name,emp_role,emp_location)
	puts "Here is the information you have given me."
	puts "Employee name: #{active_record.name}"
	puts "Role in company: #{active_record.role}"
	puts "Location: #{active_record.location}"
	puts "Is this correct? (Y/N)"
	ans = gets.chomp.downcase
	if ans != 'y'
		new_record(directory)
	elsif ans == 'y'
		directory.push(active_record)
		puts "Saved forever. Would you like to enter another new employee?"
		ans2 = gets.chomp.downcase
		if ans2 == 'y'
			new_record(directory)
		else
			puts 'returning to Main Menu'
			system 'cls'
			main_menu(directory)
		end
	end
end


def view_record(directory)
	puts "Employee Lookup"
	puts "-------------------------"
	puts "What is the employee's name?"
	name = gets.chomp
	puts "What is #{name}'s role?"
	role = gets.chomp
	puts "What is #{name}'s location?"
	location = gets.chomp
	active_record = ""
	not_found = true
	directory.each do |e|
		if e.name == name && e.role == role && e.location == location
			active_record = e
			not_found = false
		end
	end
	if not_found
		puts "Record not found. Trying again."
		view_record(directory)
	end
	puts "You are looking for the records of #{active_record.name}, a #{active_record.role} who works in the company's #{active_record.location} branch. Is this who you were looking for? (Y/N)"
	response = gets.chomp.downcase
	if response == 'y'
		puts "You found them! Now what do you want?"
		puts "1. Nothing, I was just engaging in some light cyber-stalking. I'll go to the Main Menu now."
		puts "2. They moved. I want to change their location."
		response2 = gets.chomp.to_i
		if response2 == 2
			employee_transfer(directory,active_record)
		else
			puts "Returning to the Main Menu."
			system "cls"
			main_menu(directory)
		end
	else
		view_record(directory)
	end
end

def employee_transfer(directory,active_record)
	puts "Transfer Employee Records"
	puts "------------------------------"
	puts "Now, we're talking about #{active_record.name}, a #{active_record.role} who's current location is listed as #{active_record.location}, correct? (Y/N)"
	choice = gets.chomp.downcase
	if choice == 'y'
		puts "Where is this employee being transferred?"
		new_location = gets.chomp
		active_record.transfer(new_location)
		puts "Done! #{active_record.name} has been transferred to #{active_record.location}."
	else
		puts "How did you even make it this far, then?"
	end
	now_what(directory)
end

def now_what(directory)
	puts"Now what would you like to do?"
	puts "1. Look up another employee."
	puts "2. Return to the Main Menu"
	response = gets.chomp.to_i
	if response == 1
		puts "Returning to employee lookup."
		system "cls"
		view_record(directory)
	elsif response == 2
		puts "Returning to Main Menu"
		system "cls"
		main_menu(directory)
	else
		puts "Invalid entry, try again."
		system "cls"
		now_what(directory)
	end
end

def exit(directory)
	puts "Thank you for using the Employee Management Terminal."
	puts "Now stop wasting my time and get back to work."
end

def main(directory)
	puts 'Welcome to the Employee Management Terminal.'
	main_menu(directory)
end

main(directory)