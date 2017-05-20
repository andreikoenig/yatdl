class AddColumnsToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :quadrant, :integer
    add_column :tasks, :time_completed, :datetime
  end
end
