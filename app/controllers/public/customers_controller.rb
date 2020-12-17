class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end


 def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
 end


 def unsubscribe
    @customer = Customer.find(params[:id])
    #ユーザーの情報を見つける
 end

def withdrawl
    @customer = Customer.find(current_customer.id)
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