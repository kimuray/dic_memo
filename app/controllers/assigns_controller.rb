class AssignsController < ApplicationController
  def create
    @emails = email_params
    @project = Project.find(assign_params[:project_id])
    Project.assigned!(@project, @emails)
    redirect_to @project, notice: I18n.t("notice.assigns.create")
  end

  private
  def assign_params
    params.require(:assign).permit(:project_id)
  end

  def email_params
    params.require(:emails).split("\s")
  end
end
