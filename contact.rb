class Contact
	def initialize(first_name, last_name, email, notes)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes
	end
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













	#As a developer, the contact class should have five
	# attributes: id, first_name, last_name, email and notes.