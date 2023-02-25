class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.where(author_id: current_user)
  end

  def show
    @group = Group.includes(:payments).find(params[:id])
    @payments = @group.latest_payments
  end

  def new
    @group = Group.new
    respond_to do |format|
      format.html { render :new, locals: { group: @group } }
    end
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon).merge(author: current_user)
  end
end
