class Customer < ApplicationRecord

  enum is_deleted: {有効: false, 無効: true}
    #有効会員はfalse、退会済み会員はtrue
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, presence: true
  validates :is_deleted, inclusion: {in: ["無効", "有効"]}
    def active_for_authentication?
        super && (self.is_deleted === "Available")
    end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :cart_items
  has_many :orders
  has_many :addresses, dependent: :destroy
end