class Public::AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
    redirect_to request.referer,flash:{notice:'新規お届け先を登録しました。'}
    else
      @addresses = current_customer.addresses
      render "index"
    end
  end

  def index
    @address = Address.new
    # current_customer追記12/23タネサカ
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
    redirect_to addresses_path,flash:{notice:'お届け先の編集をしました。'}
    else
      render "edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path,flash:{notice:'お届け先を削除しました。'}
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
