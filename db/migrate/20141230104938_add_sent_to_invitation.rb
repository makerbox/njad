class AddSentToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :sent, :boolean
  end
end
