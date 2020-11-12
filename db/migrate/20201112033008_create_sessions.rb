class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :time_studied
      t.datetime :date_completed
      t.text :notes
      t.integer :user_id
      t.integer :study_list_id

      t.timestamps null: false
    end
  end
end
