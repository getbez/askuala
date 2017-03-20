class Preference < ActiveRecord::Base
  enum presentation_mode: { text:0, video:1}
  enum resource_type: { core_concept:0, example:1}
end
