class Meeting < ApplicationRecord
	validates :name,  :presence => true, :length => { :minimum => 5 }
    validates :description, :presence => true, :length => { :minimum => 5 }
    validates :start_time, :presence => true


	belongs_to :user
	belongs_to :priority

end
