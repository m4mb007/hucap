class AddSerialNumberToParticipants < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :serial_num, :integer
  end
end
