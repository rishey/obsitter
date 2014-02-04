class CreateSpecialWords < ActiveRecord::Migration
  def change
    create_table :special_words do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
