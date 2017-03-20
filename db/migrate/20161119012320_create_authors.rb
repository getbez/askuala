class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :user_id
    end
  end
end
