class WordKorController < ApplicationController
  def index
  end

  def search
    @word = KorWord.find_by_word params[:search_word]
    if @word
      redirect_to word_kor_path(@word)
    else
      render 'index'
    end
  end

  def show
    @word = KorWord.find(params[:id])
  end
end
