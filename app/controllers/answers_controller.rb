class AnswersController < ApplicationController
  before_action :find_ques
  before_action :find_ans, only: [:destroy, :edit, :update, :upvote, :downvote]

  def create
    @ans = @ques.answers.create(params[:answer].permit(:content))
    @ans.user_id = current_user.id

    if @ans.content == ""
      redirect_to question_path(@ques)
      return
    end

    if @ans.save
      redirect_to question_path(@ques)
    else
      render 'new'
    end
  end

  def destroy
    @ans.destroy
    redirect_to question_path(@ques)
  end

  def edit
  end

  def update
    if @ans.update(params[:answer].permit(:content))
      redirect_to question_path(@ques)
    else
      render 'edit'
    end
  end

  # def upvote
  #   @ques = Question.find(params[:question_id])
  #   @ans = @ques.answers.find(params[:id])
  #   @ans.upvote_from current_user
  #   redirect_to question_path(@ques)
  # end
  #
  # def downvote
  #   @ques = Question.find(params[:question_id])
  #   @ans = @ques.answers.find(params[:id])
  #   @ans.downvote_from current_user
  #   redirect_to question_path(@ques)
  # end

  private

  def find_ques
    @ques = Question.find(params[:question_id])
  end

  def find_ans
    @ans = @ques.answers.find(params[:id])
  end
end
