class AutocompleteSearchService
  include HTTParty

  def initialize(term, dict)
    @term = term.downcase
    @dict = dict
  end


  def call
    @term.contains_cjk? ? foreign_query : fr_query
  end

  private

  def fr_query
    @dict.words.left_joins(:nuances).left_joins(:traductions).where('traductions.trad LIKE ? ', "%#{@term}%").order('nuances.order DESC').uniq.take(10).map { |word| { word: word.word, trad: word.traductions.where('trad LIKE ?', "%#{@term}%").first.trad } }
  end

  def foreign_query
    @dict.words.where('word LIKE ?', "#{@term}%").take(10).map { |word| {word: word.word, trad: word.traductions.first.trad }}
  end
end
