class History < ApplicationRecord
	belongs_to :tag, required: false
end
