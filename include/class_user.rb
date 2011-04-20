class Iplocator::User < Knj::Datarow
	def self.list(d)
		sql = "SELECT * FROM #{table} WHERE 1=1"
		ret = list_helper(d)
		
		d.args.each do |key, val|
			raise sprintf(_("Invalid key: %s."), key)
		end
		
		sql += ret[:sql_where]
		sql += ret[:sql_order]
		sql += ret[:sql_limit]
		
		return d.ob.list_bysql(table, sql)
	end
	
	def self.add(data)
		raise _("Invalid username.") if data[:username].to_s.length <= 0
	end
	
	def html
		return self[:username].html
	end
end