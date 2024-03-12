class AddColumnsToParticipants < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :email, :string
    add_column :participants, :phone, :string
  end
end
