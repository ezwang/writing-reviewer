class EssaysController < ApplicationController
  before_action :authenticate_user!
  before_action :check_teacher!, only: [:destroy]
  before_action :set_assignment
  before_action :set_essay, only: [:show, :destroy]

  # GET /essays
  # GET /essays.json
  def index
    redirect_to assignment_path(@assignment) unless current_user.teacher? || @assignment.past_due?
    if current_user.student?
      @group = @assignment.user_assignments.find_by(user_id: current_user).group
    end
    @essays = @assignment.essays
  end

  # GET /essays/1
  # GET /essays/1.json
  def show
    redirect_to assignment_path(@assignment) unless current_user.teacher? || @assignment.past_due? || @essay.user_assignment.user == current_user
  end

  # GET /essays/new
  def new
    @essay = Essay.new
  end

  # POST /essays
  # POST /essays.json
  def create
    @essay = Essay.new(essay_params)
    @essay.user_assignment = @assignment.user_assignments.find_by(user: current_user)

    respond_to do |format|
      if @essay.save
        format.html { redirect_to assignment_essay_path(@assignment, @essay), notice: 'Essay was successfully created.' }
        format.json { render :show, status: :created, location: @essay }
      else
        format.html { render :new }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /essays/1
  # DELETE /essays/1.json
  def destroy
    @essay.destroy
    respond_to do |format|
      format.html { redirect_to assignment_essays_path, notice: 'Essay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_essay
    @essay = Essay.find(params[:id])
  end

  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def essay_params
    params.require(:essay).permit(:file)
  end
end
