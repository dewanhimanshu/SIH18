class DeadlineController < ApplicationController

  def new
    @deadline=Deadline.new
  end

  def create

    @deadline=Deadline.create(set_params)
      @deadline.user_id = current_user.id
      @deadline.save
    redirect_to admin_index_path
  end

  def edit
    @deadline=Deadline.find(params[:id])
  end

  def update
    Deadline.update(set_params)
    redirect_to admin_index_path
  end

  def destroy
    @deadline=Deadline.find(params[:id]).destroy
    redirect_to admin_index_path
  end

  private
  def set_params
    params.require(:deadline).permit(:timmer)
  end


end
