module UselessRoutes
  class ReporterPresenter
    attr_reader :reporter, :routes_without_views, :routes_without_actions, :views_without_actions, :views_without_routes, :routes_with_bad_seo

    def initialize(reporter:)
      @reporter = reporter
      @routes_without_views = reporter.routes_without_views
      @routes_without_actions = reporter.routes_without_actions
      @views_without_actions = reporter.views_without_actions
      @views_without_routes = reporter.views_without_routes
      @routes_with_bad_seo = reporter.routes_with_bad_seo
    end

    def call
      puts "\n"
      display_routes_without_views
      puts "\n"
      display_routes_without_actions
      puts "\n"
      display_views_without_actions
      puts "\n"
      display_views_without_routes
      puts "\n"
      # display_routes_with_bad_seo
      puts "\n"
      report
    end

    def display_routes_without_views
      puts "You have #{routes_without_views.size} #{'route'.pluralize(routes_without_views.size)} without views:".colorize(:yellow)
      routes_without_views.each do |route|
        puts route.colorize(:red)
      end
    end

    def display_routes_without_actions
      puts "You have #{routes_without_actions.size} #{'route'.pluralize(routes_without_actions.size)} without actions:".colorize(:yellow)
      routes_without_actions.each do |route|
        puts route.colorize(:blue)
      end
    end
    
    def display_views_without_actions
      puts "You have #{views_without_actions.size} #{'view'.pluralize(views_without_actions.size)} without actions:".colorize(:yellow)
      views_without_actions.each do |view|
        puts view.colorize(:red)
      end
    end
    
    def display_views_without_routes
      puts "You have #{views_without_routes.size} #{'view'.pluralize(views_without_routes.size)} without routes:".colorize(:yellow)
      views_without_routes.each do |view|
        puts view.colorize(:blue)
      end
    end

    def display_routes_with_bad_seo
      puts "You have #{routes_with_bad_seo.size} #{'view'.pluralize(routes_with_bad_seo.size)} with bad seo:".colorize(:yellow)
      routes_with_bad_seo.each do |route|
        puts route.colorize(:red)
      end
    end

    def report
      puts "#{'Route'.pluralize(routes_without_views.size)} without views : #{routes_without_views.size} ".black.on_white
      puts "#{'Route'.pluralize(routes_without_actions.size)} without actions : #{routes_without_actions.size}".black.on_white
      puts "#{'View'.pluralize(views_without_actions.size)} without actions : #{views_without_actions.size}".black.on_white
      puts "#{'View'.pluralize(views_without_routes.size)} without routes : #{views_without_routes.size}".black.on_white
      # puts "#{'Route'.pluralize(routes_with_bad_seo.size)} with bad SEO : #{routes_with_bad_seo.size}".black.on_white
    end
  end
end