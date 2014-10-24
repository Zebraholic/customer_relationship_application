require_relative "contact"
require_relative "rolodex"
puts "\e[H\e[2J"

class CRM

	def print_main_menu
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Delete a contact"
	  puts "[4] Display all the contacts"
	  puts "[5] Display an attribute"
	  puts "[6] Exit"
	  puts
	  puts "Enter a number: "
	end

	def main_menu
	  print_main_menu
	  user_selected = gets.to_i
	  call_option(user_selected)
	end

	def call_option(user_selected)
	  add_new_contact if user_selected == 1
	  modify_existing_contact if user_selected == 2
	  delete_a_contact if user_selected == 3
	  display_all_the_contacts if user_selected == 4
	  disply_an_attribute if user_selected == 5
	  exit if user_selected == 6
	end
	  # Finish off and do the rest for 3 through 6
	  # To be clear, the methods add_new_contact and modify_existing_contact
	  # haven't been defined yet
end
crm = CRM.new
crm.main_menu
crm.print_main_menu
#CRM.run(CRM)


