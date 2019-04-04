class ListesController < ApplicationController
  before_action :find_list, only: [:destroy, :show]
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

  def show
    redirect_to listes_path unless current_user.id == @liste.user_id
  end

  def add_word_from_list
    add_word_from_list2(params[:list_id], params[:nuance_id])
  end

  def add_word_and_list
    @new_list = Liste.new(name: params[:name], user_id: current_user.id)
    @new_list.save
    add_word_from_list2(@new_list.id, params[:nuance_id])
  end

  def destroy
    @liste.destroy
    redirect_to listes_path
  end

  private

  def find_list
    @liste = Liste.find(params[:id])
  end

  def add_word_from_list2(listid, nuanceid)
    @new_selection = Selection.new(liste_id: listid, nuance_id: nuanceid)
    @new_selection.save
    redirect_back fallback_location: root_path
  end

  def allow_params
    params.require(:liste).permit(:name)
  end
end
