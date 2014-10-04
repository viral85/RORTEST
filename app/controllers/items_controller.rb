class ItemsController < ApplicationController
	def new
	  @list = List.find(params[:list_id])
	  @item = @list.items.new
	end
	
	def create
	  @list = List.find(params[:list_id])
	  @item = @list.items.new(item_params)
	  if @item.save
		redirect_to lists_path(params[:list_id])
	  else
		render :new
	  end
	end
	
	def edit
	  @list = List.find(params[:list_id])
	  @item = @list.items.find(params[:id])
	end
	
	def update
	  @list = List.find(params[:list_id])
	  @item = @list.items.find(params[:id])
	  @item_saved = @item.update_attributes(item_params)
	  if @item_saved
		redirect_to lists_path(params[:list_id])
	  else
		render :new
	  end
	end
	
	def destroy
	  @list = List.find(params[:list_id])
	  @item = @list.items.find(params[:id])
	  @destroyed = @item.destroy
	  if @destroyed
		redirect_to lists_path(params[:list_id])
	  else
		render :edit
	  end
	end
	
	private
	  def item_params
	    params.require(:item).permit(:list_id, :name, :comment, :completed)
	  end
end
