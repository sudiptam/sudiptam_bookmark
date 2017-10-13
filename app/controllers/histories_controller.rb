class HistoriesController < ApplicationController
	respond_to :json
  
  def index
    respond_with History.all
  end
  
  def show
    respond_with History.find(params[:id])
  end
   
  def create
    p "----------------------------------------"
    p permited_params
    respond_with History.create(permited_params)
  end
  
  def update
    p = History.find(params[:id])
    if params[:tag_name]
      tag_name = params[:tag_name]
      tag = Tag.where(:name => tag_name).first
      p tag
      p "----------------------------"
      if tag
        p.tag_id = tag.id
      else
        tag = Tag.create(:name => tag_name)
        p.tag_id = tag.id
      end
    end
    p.update(permited_params)
    respond_with p
  end
  
  def destroy
    respond_with History.destroy(params[:id])
  end

  def showFavorite
    respond_with History.where('favorites' => true)
  end

  def showArchive
    respond_with History.where('archive' => true)
  end

  def showSelected
    @el = Tag.find(params[:id])
    respond_with @el.histories
  end

  def permited_params
    params.require(:history).permit(:url ,:title ,:favorites ,:archive)
  end

end
