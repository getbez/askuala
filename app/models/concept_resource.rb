# # create_table  :concept_resources do |t|
# t.binary   :content
# t.string   :content_type
# t.string   :file_name
# t.string   :level
# t.integer  :presentation_mode
# t.integer  :resource_type
# t.integer  :concept_id
# # end

class ConceptResource < ApplicationRecord
  belongs_to :concept

  def initialize(params = {})
  content = params.delete(:content)
  super
  if content
    self.file_name = sanitize_filename(content.original_filename)
    self.content_type = content.content_type
    self.content = content.read
  end
end
private
  def sanitize_filename(filename)
    # Get only the filename, not the whole path (for IE)
    # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
    return File.basename(filename)
  end
end
