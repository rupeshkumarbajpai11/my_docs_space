class CreateFileRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :file_records do |t|
      t.string :title
      t.text :description
      t.string :file
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
