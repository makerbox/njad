class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships
	has_many :invitations
	validates :name, presence: true, uniqueness: true
	accepts_nested_attributes_for :invitations, allow_destroy: true
end
