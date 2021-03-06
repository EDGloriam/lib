class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(args_hash)
    @name = args_hash[:name]
    @email = args_hash[:email]
    @city = args_hash[:city]
    @street = args_hash[:street]
    @house = args_hash[:house]
  end

  def to_s
    " Name: #{@name}"
  end
end
