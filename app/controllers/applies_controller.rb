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
    if current_user.type_account == true
      if @appl.status == "accepted" || @appl.status == "declined"
        if @appl.update(set_params)
          redirect_to root_path
          flash[:success] = "Saved"
        else
          redirect_to root_path
          flash[:success] = "Not Saved"
        end
      else
        redirect_to root_path
      end
    else
      if @appl.update(set_params)
        redirect_to root_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    @appl.destroy
    redirect_to root_path
  end

  private
  def set_params
    params.require(:apply).permit(:first_name, :last_name, :dob, :aadhaar, :user_id, :feedback)
  end

  def find_apply
    @appl = Apply.find(params[:id])
  end
end
