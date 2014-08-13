class HotModel < ActiveRecord::Base
  has_many :stuff, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :bro, dependent: :destroy
  has_many :other_things, dependent: :destroy

  with_options(dependent: :destroy) do |model|
    model.has_many :stuff
    model.has_many :products
  end

end

class ProductService
  def email_products(product_context)
    with_options context: product_context do |service|
      service.notify
      service.update_stuff_in
    end
  end

  def notify(options={})
  end
end
