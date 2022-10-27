desc "List useless routes"
namespace :useless_routes do
  task report: :environment do
    # Task goes here
    UselessRoutes::Reporter.new.call
  end
end
