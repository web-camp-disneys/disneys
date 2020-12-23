class Admins::HomesController < ApplicationController
  # adominsフォルダのhomes_controller
  def top
    @orders = Order.all
  end
end
