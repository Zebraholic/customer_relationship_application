require_relative "contact"
require_relative "rolodex"
puts "\e[H\e[2J"
puts "ACME CUSTOMER RELATIONSHIP MANAGEMENT SYSTEM"

class CRM

	def print_main_menu
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Search and display a contact"
	  puts "[4] Delete a contact"
	  puts "[5] Display all the contacts"
	  puts "[6] Display a contact's attribute"
	  puts "[7] Exit this system"
	  puts
	  puts "Please enter a number from the above options: "
	end

	def main_menu
	  print_main_menu
	  user_selected = gets.to_i
	  call_option(user_selected)
	end

	def call_option(user_selected)
	  case user_selected
	  when 1 then add_new_contact		
	  when 2 then modify_existing_contact
	  when 3 then display_one_contact
	  when 4 then delete_a_contact
	  when 5 then display_all_the_contacts
	  when 6 then disply_an_attribute
	  exit if user_selected == 7
	end

	def add_new_contact
	  print "Enter First Name: "
	  first_name = gets.chomp
	  print "Enter Last Name: "
	  last_name = gets.chomp
	  print "Enter Email Address: "
	  email = gets.chomp
	  print "Enter a Note: "
	  note = gets.chomp
	  contact = Contact.new(first_name, last_name, email, note)
	end

	def modify_existing_contact
	  print "Change First Name: "
	  first_name = gets.chomp
	  print "Change Last Name: "
	  last_name = gets.chomp
	  print "Change Email Address: "
	  email = gets.chomp
	  print "Change your Note: "
	  note = gets.chomp
	  contact = Contact.new(first_name, last_name, email, note)
	end
end	
end
crm = CRM.new
crm.main_menu
