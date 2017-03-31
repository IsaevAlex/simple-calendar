class AddPriorityIdToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :priority_id, :integer
  end
end
