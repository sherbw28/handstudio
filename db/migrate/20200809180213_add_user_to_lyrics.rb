class AddUserToLyrics < ActiveRecord::Migration[5.2]
  def change
    add_reference :lyrics, :user, foreign_key: true
  end
end
