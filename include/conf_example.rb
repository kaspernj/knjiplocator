#This file should be renamed to conf.rb once altered to the correct values.
#
#Remember to run "scripts/update_db.rb" to create "admin:admin" example user and create the tables and so on.

$db = Knj::Db.new(
	:type => "mysql",
	:subtype => "mysql2",
	:host => "localhost",
	:user => "ip_locator",
	:pass => "your_password",
	:db => "ip_locator"
)

$config = {
	:path => "/home/user/Ruby/knjiplocator"
}