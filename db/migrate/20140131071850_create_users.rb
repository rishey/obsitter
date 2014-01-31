class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :protect_tweets
      t.string :full_name
      t.string :location
      t.string :web_site
      t.text :bio

      t.timestamps
    end
  end
end
