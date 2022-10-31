module UselessRoutes
  class ReporterPresenter
    attr_reader :reporter, :routes_without_views, :routes_without_actions

    def initialize(reporter:)
      @reporter = reporter
      @routes_without_views = reporter.routes_without_views
      @routes_without_actions = reporter.routes_without_actions
    end

    def call
      puts "\n"
      puts "You have #{routes_without_views.size} #{'route'.pluralize(routes_without_views.size)} without view:".colorize(:yellow)
      display_routes_without_views
      puts "\n"
      puts "You have #{routes_without_actions.size} #{'route'.pluralize(routes_without_actions.size)} without action:".colorize(:yellow)
      display_routes_without_actions
      puts "\n"
      report
    end

    def display_routes_without_views
      routes_without_views.each do |route|
        puts route.colorize(:red)
      end
    end

    def display_routes_without_actions
      routes_without_actions.each do |route|
        puts route.colorize(:red)
      end
    end

    def report
      puts "#{'Route'.pluralize(routes_without_views.size)} without view : #{routes_without_views.size} ".colorize(:blue)
      puts "#{'Route'.pluralize(routes_without_actions.size)} without action : #{routes_without_actions.size}".colorize(:blue)
    end
  end
end