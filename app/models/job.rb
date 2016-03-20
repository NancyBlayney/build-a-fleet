class Job < ActiveRecord::Base
	validates :name, uniqueness: true
	belongs_to :boat
end
