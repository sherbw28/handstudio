class CreateLyrics < ActiveRecord::Migration[5.2]
  def change
    create_table :lyrics do |t|
      t.string :title
      t.text :content
      t.text :meaning

      t.timestamps
    end
  end
end
