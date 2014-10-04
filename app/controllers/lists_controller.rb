class ListsController < ApplicationController

	def index
	  @lists = current_user.lists.all
	  if params[:format].present?
		@list_to_show = current_user.lists.find(params[:format])
		if @list_to_show.present?
		  @items = @list_to_show.items
		else
		  @items = nil
		end
	  else
		@list_to_show = current_user.lists.first
		if @list_to_show.present?
		  @items = @list_to_show.items
		else
		  @items = nil
		end
	  end
	end
	
	def new
	  @list = List.new
	end
	
	def create
	  @list = current_user.lists.new(list_params)
	  if @list.save
	    redirect_to lists_path
	  else
	    render :new
	  end
	end
	
	def destroy
	  @list = List.find(params[:id])
	  @destroyed = @list.destroy
	  if @destroyed
		redirect_to lists_path
	  else
		render :edit
	  end
	end
	
	private
	  def list_params
	    params.require(:list).permit(:user_id, :name, :description)
	  end

end
