class AddPlanToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :plan_id, :integer
  end
end
