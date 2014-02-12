require 'spec_helper'

describe "Users" do
  describe "Get Index" do
    it "should have content 'All Users'" do
      visit '/users'
      expect(page).to have_content('All Users')
    end

    it "should have the title 'obsitter'" do
      visit '/blurts'
      expect(page).to have_title ('obsitter')
    end

  end
end


