module NpsSurveys
  class Engine < ::Rails::Engine
    isolate_namespace NpsSurveys

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |path|
          app.config.paths['db/migrate'] << path
          ActiveRecord::Migrator.migrations_paths << path
        end
      end
    end
  end
end
