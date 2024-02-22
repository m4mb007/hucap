class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :ics_no
      t.string :course

      t.timestamps
    end
  end
end
