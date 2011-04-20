files = [
	"conf.rb",
	"class_iplocator.rb"
]
files.each do |file|
	_kas.loadfile "#{File.dirname(__FILE__)}/#{file}"
end

$site = Iplocator.new

$ob = Knj::Objects.new(
	:db => $db,
	:class_path => File.dirname(__FILE__),
	:module => Iplocator,
	:datarow => true
)

def _(str)
	kas = _kas
	return str if !kas
	return kas.gettext.trans(_session[:locale], str)
end