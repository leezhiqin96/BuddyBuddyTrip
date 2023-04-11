class AddRoleToCollaborations < ActiveRecord::Migration[7.0]
  def change
    add_column :collaborations, :role, :string, null: false
  end
end
