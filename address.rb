class Address
  attr_accessor :kind, :street_1, :street_2, :city, :state, :postal_code #accessors for all fields of an address.

  def to_s(format = 'short')# adding to the to_s function
    address = ''
    case format
    when 'short'
      address += "#{kind}: "
      address += street_1
      if street_2
        address += " " + street_2
      end
      address += ", #{city}, #{state}, #{postal_code}"
    when 'long' #exclusively using long right now.
      address += street_1 + "\n"
      address += street_2 + "\n" if !street_2.nil? #if statement afterwards
      address += "#{city}, #{state}, #{postal_code}"
    end
    address
  end
end
