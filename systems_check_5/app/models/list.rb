class List < ActiveRecord::Base


  has_many :tasks, dependent: :destroy # thanks to the wonderful documentation at stack overflow.

  has_many :memberships
  has_many :users, through: :memberships

end
