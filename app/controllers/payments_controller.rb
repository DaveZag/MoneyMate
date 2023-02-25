class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @groups = Group.where(author: current_user)
    @payment = Payment.new

    respond_to do |format|
      format.html { render :new, locals: { payment: @payment } }
    end
  end

  def create
    @payment = Transaction.new(payment_params)

    respond_to do |format|
      format.html do
        if @payment.save
          flash[:sucess] = 'Transaction Saved Successfully'
          redirect_to categories_path
        else
          flash.now[:error] = 'Error: The New Transaction could not be saved'
          render :new, locals: { payment: @payment }
        end
      end
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id).merge(author: current_user)
  end
end
