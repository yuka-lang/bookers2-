class RemoveFollowedFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :Followed, :integer
  end
end
