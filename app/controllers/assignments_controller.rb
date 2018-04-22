# frozen_string_literal: true

class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :check_owner!, only: [:edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = current_user.student? ? current_user.assignments : current_user.given_assignments
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.creator = current_user

    respond_to do |format|
      if @assignment.save
        save_students(@assignment)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        save_students(@assignment)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def save_students(assignment)
    @students = params[:students].split(',').map { |email| User.find_by_email(email) }
    @groups = JSON.parse(params[:groups])
    # remove old students
    assignment.students.each do |student|
      assignment.user_assignments.where(user: student).destroy_all unless @students.include?(student)
    end

    # add new students
    @students.each do |student|
      assignment.user_assignments.create(user: student, group: 0) unless assignment.students.include?(student)
    end

    @groups.each do |item|
      assignment.user_assignments.joins(:user).find_by(users: { email: item[0] }).update(group: item[1])
    end
  end

  def check_owner!
    redirect_to root_path unless @assignment.creator == current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def assignment_params
    params.require(:assignment).permit(:title, :description, :due_date, :review_date, :students, :groups)
  end
end
