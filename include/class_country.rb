class Iplocator::Country < Knj::Datarow
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
		raise "No valid name given." if d.data[:name].to_s.strip.length <= 0
		raise "No valid short2-name given." if d.data[:name_short2].to_s.strip.length <= 0
		raise "No valid short3-name given." if d.data[:name_short3].to_s.strip.length <= 0
	end
	
	def html
		return self[:name].html
	end
end