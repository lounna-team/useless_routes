module UselessRoutes
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "tasks/useless_routes_tasks.rake"
    end
  end
end
