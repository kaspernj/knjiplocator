class Iplocator::Ip_range < Knj::Datarow
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
	
	def self.add(d)
		country = d.ob.get(:Country, d.data[:country_id])
	end
	
	def country
		return ob.get_try(self, :country_id, :Country)
	end
end