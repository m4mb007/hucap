class AddVenueToCourseCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :course_categories, :venue, :string
  end
end
