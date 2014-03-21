class SpecialwordsController < ApplicationController

  def index
    @specialwords = SpecialWord.all
  end

end