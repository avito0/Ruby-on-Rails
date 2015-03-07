class CreateTwitterProfiles < ActiveRecord::Migration
  def change
    create_table :twitter_profiles do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.text :latest_tweet

      t.timestamps
    end
  end
end
