# == Schema Information
#
# Table name: concept_prerequisites
#
#  id              :integer          not null, primary key
#  concept_id      :integer          not null
#  prerequisite_id :integer          not null
#

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class ConceptPrerequisite < ActiveRecord::Base
   belongs_to :concept, :foreign_key => "concept_id", :class_name => "Concept"
   belongs_to :prerequisite, :foreign_key => "prerequisite_id", :class_name => "Concept"  
end
