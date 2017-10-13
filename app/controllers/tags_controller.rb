class TagsController < ApplicationController

	respond_to :json

	def index
    	respond_with Tag.all
    end

end
