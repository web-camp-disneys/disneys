class Customer < ApplicationRecord

  enum is_deleted: {Available: false, Invalid: true}
    #有効会員はfalse、退会済み会員はtrue
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted, presence: true

    def active_for_authentication?
        super && (self.is_deleted === "Available")
        # 退会したらログインできないようにしている
    end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :cart_items
  has_many :orders
  has_many :addresses, dependent: :destroy
end