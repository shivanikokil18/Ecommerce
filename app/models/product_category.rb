class ProductCategory < ApplicationRecord

    has_many :products, :dependent => :destroy

    #validates_associated :products
    #validates :product, presence: true

    #after_touch do |pc|
     #   puts "You have touched an object"
    #end

end
