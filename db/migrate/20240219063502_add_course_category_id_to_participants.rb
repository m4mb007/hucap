class AddCourseCategoryIdToParticipants < ActiveRecord::Migration[7.1]
  def change
    add_reference :participants, :course_category, null: true, foreign_key: true
  end
end
