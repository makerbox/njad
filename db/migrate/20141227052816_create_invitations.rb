class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.references :group, index: true

      t.timestamps
    end
  end
end
