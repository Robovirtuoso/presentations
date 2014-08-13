class ContextSpecificProduct
  attr_reader :name, :product, :price

  def initialize(name, product, price)
    @name = name
    @product = product
    @price = price
  end

  def initialize(options={})
    @name = options[:name]
    @product = options[:product]
    @price = options[:price]
  end

  def to_s
  end
end

ContextSpecificProduct.new(
  name: 'Hairy Boot',
  product: Product.find_by_name('Hairy Boot'),
  price: Money.new(10)
)


