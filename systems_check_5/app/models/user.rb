class User < ActiveRecord::Base
  has_many :tasks
  belongs_to :lists, through: :memberships
end
