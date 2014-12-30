class RemoveUserFromInvitation < ActiveRecord::Migration
  def change
    remove_reference :invitations, :user, index: true
  end
end
