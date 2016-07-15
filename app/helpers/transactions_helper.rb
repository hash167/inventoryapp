module TransactionsHelper
	def transaction_info transaction, count
		if transaction.user != nil
			name = transaction.user.name
		else
			name = ''
		end
		"#{count+1}) #{transaction.item.serial} has been #{transaction.transaction_type} to/from #{name} on #{transaction.created_at}"
	end
end
