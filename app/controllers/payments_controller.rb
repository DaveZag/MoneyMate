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
    @payment = Payment.new(payment_params)

    respond_to do |format|
      format.html do
        if @payment.save
          flash[:notice] = 'Transaction Saved Successfully'
          redirect_to group_path(id: payment_params['group_id'])
        else
          flash.now[:error] = 'Error: The New Transaction could not be saved'
          render :new, locals: { payment: @payment }
        end
      end
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :group_id).merge(author: current_user)
  end
end
