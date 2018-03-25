class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_ques, only: [:show, :edit, :destroy, :update, :upvote, :downvote]

  def index
    @ques = Question.all.order("hits DESC")
  end

  def new
    @ques = current_user.questions.build
  end

  def create
    @ques = current_user.questions.build(set_params)
    if @ques.content == ""
      render 'new'
    return
    end
    if @ques.save(set_params)
        redirect_to question_path(@ques)
    else
      render 'new'
    end
  end

  def show
    @ques.hits ||= 0
    @ques.hits  += 1
    @ques.save

    @ans = Answer.where(question_id: @ques).order('created_at DESC')
  end

  def edit
  end

  def update
    if @ques.update(set_params)
      redirect_to question_path(@ques)
    else
      render 'edit'
    end
  end

  def destroy
    @ques.destroy
    redirect_to questions_path
  end

  # def upvote
  #   @ques.upvote_from current_user
  #   redirect_to question_path(@ques)
  # end
  #
  # def downvote
  #   @ques.downvote_from current_user
  #   redirect_to question_path(@ques)
  # end

  private
  def find_usr
    @user = User.find(params[:id])
  end

  def find_ques
    @ques = Question.find(params[:id])
  end

  def set_params
    params.require(:question).permit(:content)
  end
end
