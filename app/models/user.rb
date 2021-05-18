class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /([\w+.]+)@[a-z0-9\-.]+\.[a-z]+/i   

  validates :email, presence: true, :uniqueness => { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  
  before_validation :ensure_login_has_a_value
 
  protected
    def ensure_login_has_a_value
      if email.nil?
        self.email = email unless email.blank?
      end
    end

    

  #validates :first_name, :last_name, presence: true

  #def full_name
   # "#{first_name} #{last_name}"
  #end
  
  has_many :user_addresses

  has_many :orders, :dependent => :destroy

  has_many :transactions

  has_many :product_reviews
  has_many :carts

  belongs_to :role


end
