module UselessRoutes
  class Reporter
    attr_reader :app
    
    def initialize
      @app = Rails.application
    end
    
    def call
      load_everything!
      UselessRoutes::ReporterPresenter.new(reporter: self).call
    end
    
    def routes_without_views
      @routes_without_views ||= get_routes.map do |route|
        "#{route.requirements[:controller]}/#{route.requirements[:action]}"
      end.reject! { |r| r.include?('rails/') || r.include?('active_storage') || r.include?('action_mailbox') }.reject! do |route|
        views.include?  "#{Rails.root}/app/views/#{route}"
      end
    end
    
    def routes_without_actions
      @routes_without_actions ||= get_routes.map do |route|
        "#{route.requirements[:controller]}##{route.requirements[:action]}"
      end.reject { |r| r.start_with? 'rails/' }.reject! do |route|
        actions.include? route
      end
    end

    private
    
    def load_everything!
      app.eager_load!
      ::Rails::InfoController rescue NameError
      ::Rails::WelcomeController rescue NameError
      ::Rails::MailersController rescue NameError
      Rails::Engine.subclasses.each(&:eager_load!)
    end

    def routes
      @routes ||= app.routes.routes.select { |r| r.requirements.present? }
    end
    
    def get_routes
      @get_routes ||= routes.select { |r| r.verb.eql?('GET') }
    end

    def views
      @views ||= Dir.glob("#{Rails.root}/app/views/**/*").each do |view|
        view.gsub!(/(.*\/[^\/\.]+)[^\/]+/, '\\1')
      end
    end

    def actions
      @actions ||= ActionController::Base.descendants.map do |controller|
        controller.action_methods.reject { |a| (a =~ /\A(_conditional)?_callback_/) || (a == '_layout_from_proc') }.map do |action|
          "#{controller.controller_path}##{action}"
        end
      end.flatten.reject { |r| r.start_with? 'rails/' }
    end
  end
end