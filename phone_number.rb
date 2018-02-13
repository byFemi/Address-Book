class PhoneNumber #this class holds a number as well as it's kind(string)
  attr_accessor :kind, :number

  def to_s #updating the built in to_s
    "#{kind}: #{number}"
  end
end
