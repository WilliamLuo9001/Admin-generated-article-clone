class Comment < ActiveRecord::Base
	acts_as_votable

	belongs_to :user
	belongs_to :article
	def score
		self.get_upvotes.size 
	end
	def self.today
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
