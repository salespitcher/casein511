module Casein
  class InstallGenerator < Rails::Generators::Base

    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def self.next_migration_number dirname
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

    def generate_files
      puts "*** INSTALLING Redactor ***"
      gem "redactor-rails"
      generate "redactor:install"


      puts "*** INSTALLING Gritter 1.1.0 ***"
      gem "gritter", "1.1.0"
      generate "gritter:locale"
     
      
      puts "*** INSTALLING Paper-Trail 3.0.6 ***"
      gem 'paper_trail', '3.0.6'
      generate "paper_trail:install"

      puts "*** WARNING - Generating configuration files. Make sure you have backed up any files before overwriting them. ***"

      #config helper
      copy_file "app/helpers/casein/config_helper.rb", "app/helpers/casein/config_helper.rb"

      #initial view partials
      copy_file "app/views/casein/layouts/_tab_navigation.html.erb", "app/views/casein/layouts/_tab_navigation.html.erb"
      copy_file "app/views/casein/layouts/_top_navigation.html.erb", "app/views/casein/layouts/_top_navigation.html.erb"
      copy_file "app/views/casein/layouts/_versions.html.erb", "app/views/casein/layouts/_versions.html.erb"

      #robots.txt
      puts " ** Overwrite if you haven't yet modified your robots.txt, otherwise add disallow rules for /casein and /admin manually **"
      copy_file "public/robots.txt", "public/robots.txt"

      #blank stylesheets and JavaScript files
      copy_file "app/assets/stylesheets/casein/custom.css.scss", "app/assets/stylesheets/casein/custom.css.scss"
      copy_file "app/assets/javascripts/casein/custom.js", "app/assets/javascripts/casein/custom.js"

      #migrations
      migration_template 'db/migrate/casein_create_admin_users.rb', "db/migrate/casein_create_admin_users.rb"

      #CONFIG
      application "config.exceptions_app = self.routes"

    end  
  end
end