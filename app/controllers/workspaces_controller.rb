class WorkspacesController < ApplicationController
  before_action :load_workspace, only: [:edit, :update, :destroy, :show]

  def index
    @workspaces = Workspace.newest.page(params[:page])
      .per Settings.pagination.per_page
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new workspace_params
    if @workspace.save
      flash[:success] = t "flash.success.created_workspace"
      redirect_to :back
    else
      flash[:danger] = t "flash.danger.workspaces.created_workspace"
      render :new
    end
  end

  def show
    @positions = @workspace.positions
    @positions_search = @positions.name_or_deskcode(params[:search])
  end

  def edit
  end

  def update
    if @workspace.update_attributes workspace_params
      flash[:success] = t "flash.success.updated_workspace"
      redirect_to workspaces_path
    else
      render :edit
    end
  end

  def destroy
    if @workspace.destroy
      flash[:success] = t "flash.success.deleted_workspace"
    else
      flash[:danger] = t "flash.danger.deleted_workspace"
    end
    redirect_to workspaces_path
  end

  private
  def workspace_params
    params.require(:workspace).permit :name, :number_of_columns,
      :number_of_rows, :description
  end

  def load_workspace
    @workspace = Workspace.find_by id: params[:id]
    unless @workspace
      flash.now[:danger] = t "flash.danger.workspace_not_found"
      redirect_to workspaces_path
    end
  end
end
