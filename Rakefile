# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'standalone_migrations'
ENV["SCHEMA"] = File.join(ActiveRecord::Tasks::DatabaseTasks.db_dir, "schema.rb")
StandaloneMigrations::Tasks.load_tasks