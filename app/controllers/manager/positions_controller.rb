class Manager::PositionsController < ApplicationController

  def edit
    @users = User.all
    @position = Position.find_by id: params[:id]
  end

  def update
    @position = Position.find_by id: params[:id]
    @workspace = @position.workspace
    if @position.staff?
      if @position.update_attributes position_params
        @position.update_status
        flash[:success] = t "flash.success.updated_workspace"
        redirect_to :back
      else
        render :edit
      end
    else
      if @position.update_attributes position_params
        flash[:success] = t "flash.success.updated_workspace"
        redirect_to :back
      else
        render :edit
      end
    end
  end
  private
  def position_params
    params.require(:position).permit :name, :description,
      :status, :user_id, :desk_code
  end
end
