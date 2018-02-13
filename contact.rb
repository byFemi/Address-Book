require "./phone_number"
require "./address"

class Contact
  attr_accessor :first_name, :middle_name, :last_name #attr_accessors and reader for all the fields
  attr_reader :phone_numbers, :addresses

  def initialize #upon class creation, set up arrays for a contacts multiple numbers and addresses
    @phone_numbers = []
    @addresses = []
  end

  def add_address(kind, street_1, street_2, city, state, postal_code) #method to create a new address for a contact
    address = Address.new
    address.kind = kind
    address.street_1 = street_1
    address.street_2 = street_2
    address.city = city
    address.state = state
    address.postal_code = postal_code
    addresses.push(address)
  end

  def add_phone_number(kind, number) #method to add a new phone number to a contact
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    phone_numbers.push(phone_number)
  end

  def last_first  #method to print out in format Doe, John R. most descriptive and compact, good for the address book printout
    last_first = last_name
    last_first += ", "
    last_first += first_name
    if !@middle_name.nil?
      last_first += " "
      last_first += middle_name.slice(0, 1)
      last_first += "."
    end
    last_first
  end


  def full_name #method to print out whole name, when specific contact is brought up.
    full_name = first_name
    if !@middle_name.nil?
      full_name += " "
      full_name += middle_name
    end
    full_name += ' '
    full_name += last_name
    full_name #return full name
  end

  def to_s(format = 'full_name')
    case format
    when 'full_name'
      full_name
    when 'last_first'
      last_first
    when 'middle' #**
      middle_name
    when 'first' #**
      first_name
    when 'last' #** these are preemptively placed for when I add the update contact method.
      last_name
    end
  end

  def print_phone_numbers
    puts "Phone Numbers"
    phone_numbers.each{|phone_number| puts phone_number} #*** these automatically calls the to_s func inside phone_number class
  end

  def print_addresses
    puts "Addresses"
    addresses.each{|address| puts address} #***
  end
end
