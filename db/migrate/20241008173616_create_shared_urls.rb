class CreateSharedUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :shared_urls do |t|
      t.string :shared_url
      t.references :file_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
