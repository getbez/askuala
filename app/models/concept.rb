# == Schema Information
#
# Table name: concepts
#
#  id        :integer          not null, primary key
#  level     :integer          not null
#  title     :string
#  course_id :integer
#

# create_table :concepts do |t|
#   t.integer  :level , null: false
#   t.string   :title
#   t.string   :course_id

class Concept < ApplicationRecord
  has_many :concept_resources  
  belongs_to :course
  has_many :concept_prerequisites,
    class_name: "ConceptPrerequisite", 
    foreign_key: "concept_id"
  has_many :prerequisites, :through => :concept_prerequisites 
  has_many :assessments
 
end


