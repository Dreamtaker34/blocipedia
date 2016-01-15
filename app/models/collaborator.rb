# == Schema Information
#
# Table name: collaborators
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  wiki_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  accepts_nested_attributes_for :user

  validates_uniqueness_of :user, scope: :wiki
end
