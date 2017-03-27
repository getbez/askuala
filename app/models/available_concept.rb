class AvailableConcept < ActiveRecord::Base

  def self.columns

    @columns ||= []

  end

  def self.column(name, sql_type = nil, default = nil, null = true)

    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)

  end

  # Manually define the columns used by this model

  column :concept_title, :string

  column :concept_level, :datetime



end