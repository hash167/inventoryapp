module ItemsHelper
	def get_user_name item
		return item.user.name if item.user
		return 'Inventory'
	end
end
