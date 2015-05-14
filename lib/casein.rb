if defined?(Rails) && Rails::VERSION::MAJOR == 4
	require 'casein/engine'
	require 'casein/version'
	require 'will_paginate'
	require 'authlogic'
  require 'breadcrumbs_on_rails'
else
	puts("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	puts("!!! WARNING !!! This version of Casein requires Rails 4.x !!!")
	puts("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
end