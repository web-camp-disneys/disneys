class Public::CustomersController < ApplicationController
  def show
    # @customer = Customer.find(params[:id])
    @customer = current_customer
  end

  def edit
    # @customer = Customer.find(params[:id])
     @customer = current_customer
  end


 def update
    # @customer = Customer.find(params[:id])
     @customer = current_customer
    @customer.update(customer_params)
    redirect_to  customers_my_page_path(@customer)
 end


 def unsubscribe
    # @customer = Customer.find(params[:id])
    #ユーザーの情報を見つける
     @customer = current_customer
 end

def withdrawl
    # @customer = Customer.find(current_customer.id)
     @customer = current_customer
    #現在ログインしているユーザーを@customerに格納
    @customer.update(is_deleted: "Invalid")
    #updateで登録情報をtrueに変更
    reset_session
    #sessionIDのresetを行う
    redirect_to root_path
    #指定されたrootへのpath
end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end