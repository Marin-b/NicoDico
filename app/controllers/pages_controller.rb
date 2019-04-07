class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @dicts = Dictionary.all
  end
end
