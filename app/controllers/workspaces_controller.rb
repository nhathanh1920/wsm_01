class WorkspacesController < ApplicationController

  def index
    @workspaces = Workspace.newest
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new workspace_params
    @workspace.save
  end

  def show
    @workspace = Workspace.find_by id: params[:id]
    @positions = @workspace.positions
  end

  private
  def workspace_params
    params.require(:workspace).permit :name, :number_of_columns, :number_of_rows
  end
end
