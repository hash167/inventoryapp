class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :edit, :update, :destroy]
	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end
	def show  
	end  

	def create
		if @item = Item.create(item_params)
			flash[:success] = "Your item has been created!"
			redirect_to items_path
		else
			flash.now[:alert] = "Your new item couldn't be created!  Please check the form."
			render :new
		end
	end
	def edit  
		@item = Item.find(params[:id])
	end

	def update  
		if @item.update(item_params)
	      flash[:success] = "Item updated."
	      redirect_to items_path
	    else
	      flash.now[:alert] = "Update failed.  Please check the form."
	      render :edit
	    end	

	end  
	def destroy  
	  @item.destroy
	  redirect_to items_path
	end  

	private

	def item_params
		params.require(:item).permit(:equipment_type,:model_number, :serial, :cost, :description,:purchase_date, :user_id)
	end

	def set_item
		@item = Item.find(params[:id])
	end
end
