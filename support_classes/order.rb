class Order
  attr_accessor :book, :reader
  attr_reader :date

  def initialize(book, reader)
    @book = book
    @reader = reader
    @date = Time.new.strftime('%Y-%m-%d %H:%M:%S')
  end
end
