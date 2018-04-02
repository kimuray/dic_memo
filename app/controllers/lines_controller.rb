class LinesController < ApplicationController
  before_action :set_line, only: [:edit, :update, :destroy]

  def new
    @project = Project.find(params[:project_id].to_i)
    @line = @project.lines.build
  end

  def edit

  end

  def create
    @project = Project.find(params[:project_id].to_i)
    @line = current_user.lines.build(line_params)
    unless @project.lines.first.nil?
      @line.position = @project.lines.order('position DESC').first.position + 1
    else
      @line.position = 1
    end
    @line.save
  end

  def update
  end

  def destroy
  end

  private
  def set_line
    @line = Line.find(params[:id])
  end

  def line_params
    params.require(:line).permit(:title, :project_id, :user_id, :position)
  end
end
