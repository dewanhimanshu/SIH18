class AppliesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_apply, only: [:edit, :update, :destroy]

  def index
    @appls = Apply.all.order('created_at ASC').paginate(page: params[:page], per_page: 1)
  end

  def new
    @appl = Apply.new
  end

  def create
    @appl = Apply.new(set_params)
    @appl.user_id = current_user.id

    if @appl.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
      if @appl.update(set_params)
        redirect_to root_path
      else
        render 'edit'
      end
  end

  def destroy
    @appl.destroy
    redirect_to root_path
  end

  def status
  end

  private
  def set_params
    params.require(:apply).permit(:first_name, :last_name, :dob, :aadhaar, :user_id, :feedback, :status,:avatar)
  end

  def find_apply
    @appl = Apply.find(params[:id])
  end
end
