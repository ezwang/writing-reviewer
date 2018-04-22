# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_essay, :set_assignment

  def create
    @review = Review.where(essay: @essay, user: current_user).first
    @review ||= Review.create(essay: @essay, user: current_user)
    @review.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to assignment_essay_path(@assignment, @essay) }
      format.json { head :no_content }
    end
  end

  private

  def set_essay
    @essay = Essay.find(params[:essay_id])
  end

  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
