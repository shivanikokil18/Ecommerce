class Product < ApplicationRecord

  enum status: [:available, :out_of_stock, :only_few_left, :not_set]

  belongs_to :product_category

  has_many :order_items
  has_many :cart_items
  has_many :product_reviews

  #validates :name, presence: true, length: { :minimum => 3 }, uniqueness: true

  #after_initialize do |product|
   # puts "You have initialized an object!"
  #end
    
  #after_find do |product|
   # puts "You have found an object!"
  #end

  after_destroy :destroy_action

  def destroy_action
    puts 'Product destroyed'
  end
end


