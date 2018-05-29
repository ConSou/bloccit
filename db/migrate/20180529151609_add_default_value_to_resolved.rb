class AddDefaultValueToResolved < ActiveRecord::Migration[5.2]
  def up
    change_column :questions, :resolved, :boolean, default: false
  end

  def down
    change_column :questions, :resolved, :boolean, default: nil
  end
end
