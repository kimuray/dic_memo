class AssignsController < ApplicationController
  def create
    @project = Project.find(assign_params[:project_id])
    User.assigned!(assign_params, assign_user_params, @project)
    redirect_to @project
  end

  private
  def assign_params
    params.require(:assign).permit(:project_id)
  end

  def assign_user_params
    params.require(:emails)
  end
end
