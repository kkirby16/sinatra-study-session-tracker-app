class CreateStudyLists < ActiveRecord::Migration
  def change
    create_table :study_lists do |t|
      t.string :topic

      t.timestamps null: false
    end
  end
end
