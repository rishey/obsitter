require 'spec_helper'

describe "Blurts" do
  describe "Get Index" do
    it "should have content 'All Blurts'" do
      visit '/blurts'
      expect(page).to have_content('All Blurts')
    end

    it "should have the title 'obsitter'" do
      visit '/users'
      expect(page).to have_title('obsitter')
    end

  end
end


