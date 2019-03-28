class KorWordController < ApplicationController
  def index
  end

  def search
    @word = KorWord.find_by_word params[:search_word]
    if @word
      redirect_to kor_word_path(@word)
    else
      render 'index'
    end
  end

  def show
    @word = KorWord.find(params[:id])
    @word.click += 1
    @word.save
  end

  def create
    raise
  end
end
