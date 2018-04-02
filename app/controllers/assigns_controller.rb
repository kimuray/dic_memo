class AssignsController < ApplicationController
  def create
    @informations = User.assigned!(assign_params, assign_user_params)
    @project = Project.find(assign_params[:project_id])
    @assign = @project.assigns.new
    render 'projects/show'
  end

  private
  def assign_params
    params.require(:assign).permit(:project_id)
  end

  def assign_user_params
    params.require(:emails)
  end
end
