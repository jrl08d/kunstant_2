class GoalsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    if user_signed_in?
      @goals = current_user.goals
      new_goals = []

      @goals.each do |goal|
        goal.occurrences(1.week.from_now).each do |goal_occur|
          new_goal = Goal.new
          new_goal.description = goal.description
          new_goal.id = goal.id
          new_goal.assigned_date = goal_occur
          new_goals << new_goal
        end
     end

     @goals_by_date = new_goals.group_by(&:assigned_date)
     @date = params[:date] ? Date.parse(params[:date]) : Date.today
     render :index
   else 
     render :index_2
   end
end



  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
    @user = current_user
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = current_user.goals.new(goal_params)
      if @goal.category_id = 1
        @goal.assigned_date = Date.today
      end

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
 def update
    respond_to do |format|
      if @goal.user != current_user
        format.html { redirect_to @goal, notice: 'That goal is not yours to edit.' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      elsif @goal.update(goal_params)
        p goal_params
        p @goal
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" } 
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    if @goal.user != current_user
     flash[:notice] = 'That goal is not yours to destroy.'

      respond_to do |format|
        format.html { redirect_to :back }
        format.json { head :no_content }
      end
    else
    @goal.destroy
     respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
     end
     end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:description, :done, :current_user, :user_id, :assigned_date, :due_date, :category_id, :category, :schedule, :recurring_rules)
    end
end
