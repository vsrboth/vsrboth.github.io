class MembershipScoringConditionsController < ApplicationController

  before_action :authenticate_account!

  def index
    @membership_scoring = MembershipScoringCondition.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @membership_scoring = MembershipScoringCondition.new
  end

  def create
    @membership_scoring = MembershipScoringCondition.new(set_membership_scoring_param)
    if @membership_scoring.save
      redirect_to membership_scoring_conditions_path
    else
      render :new
    end
  end

  def edit
    @membership_scoring = MembershipScoringCondition.find(params[:id])
  end

  def update
    @membership_scoring = MembershipScoringCondition.find(params[:id])
    if @membership_scoring.update_attributes(set_membership_scoring_param)
      redirect_to membership_scoring_conditions_path
    else
      render :edit
    end
  end

  def destroy
    @membership_scoring = MembershipScoringCondition.find(params[:id])
    if @membership_scoring.destroy
      redirect_to membership_scoring_conditions_path
    else

    end
  end

  private
    def set_membership_scoring_param
      params.require(:membership_scoring_condition).permit(:first_operand, :operator, :second_operand, :score)
    end

end
