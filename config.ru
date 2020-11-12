require "./config/environment"

if ActiveRecord::Migrator.needs_migration?
  raise "Migrations are pending. Run `rake db:migrate` to resolve the issue."
end

use Rack::MethodOverride

#mount other controllers with use here.

use UsersController
use SessionsController
use StudyListsController
run ApplicationController
