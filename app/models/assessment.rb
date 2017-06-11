class Assessment < ApplicationRecord
    enum level:{
        beginner: 1,
        intermediate: 2,
        advanced: 3
    }
    has_many :questions
end
