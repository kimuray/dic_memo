class LinesController < ApplicationController
  before_action :set_line, only: [:edit, :update, :destroy]
  before_action :set_project, only: [:edit, :update, :destroy]

  def new
    @project = Project.find(params[:project_id].to_i)
    @line = @project.lines.build
  end

  def edit
  end

  def create
    @project = Project.find(params[:project_id].to_i)
    @line = current_user.lines.build(line_params)
    @project.lines.first.nil? ? @line.position = 1 : @line.position = @project.lines.order('position ASC').last.position + 1
    @line.save ? (redirect_to @project, notice: I18n.t("notice.lines.create")) : (render :new)
  end

  def update
    @line.update(line_params) ? (redirect_to @project, notice: I18n.t("notice.lines.update")) : (render :edit)
  end

  def destroy
    @line.destroy
    redirect_to @project, notice: I18n.t("notice.lines.destroy")
  end

  private
  def set_line
    @line = Line.find(params[:id])
  end

  def set_project
    @project = @line.project
  end

  def line_params
    params.require(:line).permit(:title, :project_id, :user_id, :position)
  end
end
