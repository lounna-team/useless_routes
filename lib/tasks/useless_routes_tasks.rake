require 'colorize'

desc "List useless routes"
namespace :useless_routes do
  task report: :environment do
    UselessRoutes::Reporter.new.call
  end
end
