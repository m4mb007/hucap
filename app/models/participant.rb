class Participant < ApplicationRecord
    belongs_to :course_category , optional: true
end
