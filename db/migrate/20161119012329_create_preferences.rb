class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :presentation_mode
      t.integer :resource_type
    end
  end
end
