class ListesController < ApplicationController
  def index
    @list = Liste.new
    @listes = Liste.where(user_id: current_user.id)
  end

  def create
    new_list = Liste.new(allow_params)
    new_list.user_id = current_user.id
    new_list.save
    redirect_to listes_path
  end

  private

  def allow_params
    params.require(:liste).permit(:name)
  end
end
