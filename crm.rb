require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
        

  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact
    puts "Enter the ID of the contact you'd like to modify:"
    id = gets.chomp.to_i
    f_contact = Contact.find(id)
    puts "Select which category you'd like to modify:"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Note"
    puts "Enter a number:"
    type = gets.chomp
    puts "What would you like it to say now?"
    updated = gets.chomp

    f_contact.update(type, updated)

  end

  def delete_contact
    puts "Enter the ID of the contact you'd like to delete:"
    id = gets.chomp.to_i
    d_contact = Contact.find(id)
    d_contact.delete
  end

  def display_all_contacts
    return Contact.all
  end

  def search_by_attribute
    puts "Select which category you'd like to search through your contacts by:"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "Enter a number:"
    type = gets.chomp
    puts "Enter the the desired keyword to search by:"
    input = gets.chomp

    p Contact.find_by(type, input)
  end


end

a_crm_app = CRM.new
a_crm_app.main_menu