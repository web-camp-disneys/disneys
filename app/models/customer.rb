class Customer < ApplicationRecord
  
  enum is_deleted: {Available: false, Invalid: true}
    #有効会員はfalse、退会済み会員はtrue

    def deleted_for_authentication?
        super && (self.is_deleted === "Invalid")
    end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
