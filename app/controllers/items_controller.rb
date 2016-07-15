class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :edit, :update, :destroy]
	def index
		@items = Item.all.order('created_at DESC')
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
		old_user = @item.user  
		if @item.update(item_params)
		  puts "Hello World ---------- #{old_user}"
		  puts "Hello World ---------- #{item_params[:user_id]}"
		  create_transactions(@item,old_user)
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

	def create_transactions(item, old_user) 
		Transaction.create(user_id: old_user.id, item_id: item.id, transaction_type: 'removed', removed_on: Date.today) if old_user
		Transaction.create(user_id: item_params[:user_id], item_id: item.id, transaction_type: 'added', assigned_on: Date.today)
	end

	private

	def item_params
		params.require(:item).permit(:equipment_type,:model_number, :serial, :cost, :description,:purchase_date, :user_id)
	end

	def set_item
		@item = Item.find(params[:id])
	end
end
