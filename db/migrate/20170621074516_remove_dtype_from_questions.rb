class RemoveDtypeFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :DTYPE
    remove_column :questions, :target_concept
    remove_column :questions, :test_code

    add_column :questions, :target_concept, :integer, null: :false
  end
end
