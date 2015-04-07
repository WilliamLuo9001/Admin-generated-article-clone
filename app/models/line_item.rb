class LineItem < ActiveRecord::Base
	belongs_to :article
	belongs_to :cart

	
end
