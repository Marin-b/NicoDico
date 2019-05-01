class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]
  before_action :admin_check, only: [:index, :destroy]

  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.all
  end

  # GET /suggestions/1
  # GET /suggestions/1.jso

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      @word = Word.find(@suggestion.words_id)
      if @word
        redirect_to dict_word_path(@word.dictionary_id, @word.word), notice: "Merci pour votre collaboration"
      else
        redirect_to root_path, notice: "Merci pour votre collaboration"
      end
    else
      format.html { render :new }
      format.json { render json: @suggestion.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /suggestions/1
  # PATCH/PUT /suggestions/1.json

  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  def destroy
    @suggestion.destroy
    redirect_to suggestions_path, notice: "Suggestion suppprimée"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def admin_check
      redirect_to root_path if current_user.status != "admin"
    end

    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:suggestion).permit(:words_id, :author, :suggestion)
    end
end
