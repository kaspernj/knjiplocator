$tables = {
	"tables" => {
		"Country" => {
			"columns" => [
				{"name" => "id", "type" => "int", "autoincr" => true, "primarykey" => true},
				{"name" => "name", "type" => "varchar"},
				{"name" => "name_short2", "type" => "varchar", "maxlength" => 2},
				{"name" => "name_short3", "type" => "varchar", "maxlength" => 3}
			]
		},
		"Ip_range" => {
			"columns" => [
				{"name" => "id", "type" => "int", "autoincr" => true, "primarykey" => true},
				{"name" => "country_id", "type" => "int"},
				{"name" => "ip_from", "type" => "bigint"},
				{"name" => "ip_to", "type" => "bigint"}
			],
			"indexes" => [
				{"name" => "country_id", "columns" => ["country_id"]},
				{"name" => "ip_lookup", "columns" => ["ip_from", "ip_to"]}
			]
		},
		"User" => {
			"columns" => [
				{"name" => "id", "type" => "int", "autoincr" => true, "primarykey" => true},
				{"name" => "username", "type" => "varchar"},
				{"name" => "password", "type" => "varchar"}
			],
			"on_create_after" => proc{|data|
				data["db"].insert("User", {
					"username" => "admin",
					"password" => Knj::Php.md5("admin")
				})
			}
		}
	}
}