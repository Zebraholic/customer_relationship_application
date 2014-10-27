require_relative "./contact.rb"
require_relative "./rolodex.rb"
puts "\e[H\e[2J"
puts "ACME CUSTOMER RELATIONSHIP MANAGEMENT SYSTEM"

class CRM

	attr_reader :name 

  	def initialize(name)
    	@name = name 
    	@rolodex = Rolodex.new
  	end	

  	#Displays main menu from which selections are made [1] to [7].
	def print_main_menu	
	  puts
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Search and display a contact"
	  puts "[4] Delete a contact"
	  puts "[5] Display all contacts"
	  puts "[6] Display a contact's attribute"
	  puts "[7] Exit this system"
	  puts
	  puts "Please enter a number from the above options: "
	end

	#Loops to display main menu options until exit [7] is selected.
	def main_menu
		while true
			print_main_menu
			user_selected = gets.chomp.to_i
				if user_selected == 7
				puts "Current session ended, goodbye!"
				return
			end
			call_option(user_selected)
		end
	end

	#Decision tree for main menu options [1] to [7].
	def call_option(user_selected) 
	  case user_selected
	  when 1 then add_new_contact		
	  when 2 then modify_existing_contact
	  when 3 then display_one_contact
	  when 4 then delete_contact
	  when 5 then display_all_contacts
	  when 6 then display_an_attribute
	  when 7
			puts "Current session ended, goodbye!"
			return
		else
			puts "Invalid Option, try again."
			return
		end	
	end

	#[1] Method for adding a new contact.
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
	  @rolodex.add_contact(contact)
	end

	#[2] Method for modifying an existing contact.
	def modify_existing_contact 
		  contact = display_one_contact	
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

	#[3] Method for displaying a contact.
	def display_one_contact
		puts "Enter Contact ID:"
  		input = gets.chomp.to_i	
  		@rolodex.contacts.each do |contact|
  			if contact.id == input
  				puts "Contact ID: #{contact.id}"
    		puts "Name: #{contact.first_name} #{contact.last_name}"
    		puts "Email: #{contact.email}"
    		puts "Notes: #{contact.note}"
    		else
    			puts "Contact not found in system, please try again."
    		end
    	end
  	end

  	#[4] Method for deleting a contact.
  	def delete_contact
  		puts "Enter Contact ID to be deleted:"
  		input = gets.chomp.to_i
  		@rolodex.contacts.each do |contact|
  			if contact.id == input
  				@rolodex.contacts.delete(contact)
  				puts "Contact Deleted."
  			else
  				puts "Contact not found in system, please try again"
  				puts "or enter [5] to display list of all contacts."
   			end
   		end		
  	end

	#[5] Method for displaying a list of all contacts.
	def display_all_contacts	
	    @rolodex.contacts.each do |contact|
	    	puts "#{contact.id} #{contact.first_name} #{contact.last_name} <#{contact.email}>"
			end
		puts
	end

	#[6] Method for displaying a contact's selected attribute.

end	

crm = CRM.new("ACME CRM")
crm.main_menu
