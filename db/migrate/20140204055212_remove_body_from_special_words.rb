class RemoveBodyFromSpecialWords < ActiveRecord::Migration
  def change
    remove_column :special_words, :body, :string
  end
end
