class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_productor!, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @assign = @project.assigns.new
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    @assign = @project.assigns.build(user: current_user)
    if @project.save && @assign.save
      redirect_to @project, notice: 'Projectの作成が完了いたしました'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Projectの更新が完了いたしました'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Projectの削除が完了いたしました'
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def authenticate_productor!
      redirect_to @project, notice: 'Projectの作成者のみが編集削除を行えます' unless current_user == @project.user
    end

    def project_params
      params.require(:project).permit(:name)
    end
end
