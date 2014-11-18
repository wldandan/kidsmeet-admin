class CreateJoinTableAgentRole < ActiveRecord::Migration
  def change
    create_join_table :agents, :roles do |t|
      # t.index [:agent_id, :role_id]
      # t.index [:role_id, :agent_id]
    end
  end
end
