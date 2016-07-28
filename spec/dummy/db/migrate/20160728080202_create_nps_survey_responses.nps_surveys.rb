# This migration comes from nps_surveys (originally 20160614145840)
class CreateNpsSurveyResponses < ActiveRecord::Migration
  def change
    create_table :nps_surveys_responses do |t|
      t.string :survey, null: false
      t.integer :user_id, null: false
      t.integer :score
      t.text :feedback

      t.timestamps
      t.foreign_key :users
    end
  end
end
