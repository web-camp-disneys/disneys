class Customer < ApplicationRecord

  enum is_deleted: {Available: false, Invalid: true}
    #有効会員はfalse、退会済み会員はtrue

    def active_for_authentication?
        super && (self.is_deleted === "Available")
    end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :cart_items
  has_many :orders
  has_many :add
  
  
  
end
