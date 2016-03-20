class Boat < ActiveRecord::Base
	validates :name, uniqueness: true, presence: true
	belongs_to :user
	has_many :jobs

	LOCATIONS = ["Charleston, SC", "Los Angeles, CA", "New Orleans, LA", "New York, NY", "Veracruz, MX"]






end

