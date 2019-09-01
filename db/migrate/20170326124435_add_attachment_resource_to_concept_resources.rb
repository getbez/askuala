class AddAttachmentResourceToConceptResources < ActiveRecord::Migration[6.0]
  def self.up
    change_table :concept_resources do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :concept_resources, :resource
  end
end