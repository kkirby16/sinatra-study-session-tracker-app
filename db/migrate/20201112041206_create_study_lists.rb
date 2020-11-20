class CreateStudyLists < ActiveRecord::Migration
  def change
    create_table :study_lists do |t|
      t.string :topic
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
