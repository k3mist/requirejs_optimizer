require 'pathname'

# This will fail when initializing assets, but we don't need
# generators for asset initialization anyway. Let it fail
# silently
#
begin; require "generators/install_generator"
rescue NameError => e; end

class RequirejsOptimizerRailtie < Rails::Railtie

  config.before_initialize do
    Rails.application.config.assets.compress = false

    %w(vendor app).each do |location|
      javascripts_root_path = Rails.root.join("#{location}/assets/javascripts/")
      modules_path          = javascripts_root_path.join("authoring", '**', '*.{coffee,js}')
      add_modules_from_path_to_precompile_list modules_path, javascripts_root_path
    end
  end

  rake_tasks do
    raketask = RequirejsOptimizer::Rake::Task.new
    raketask.define_tasks
    raketask.extend_default_precompile unless ENV['NO_RJS']
  end

  def add_modules_from_path_to_precompile_list modules_path, root_path
    modules = Dir[modules_path].reject { |f| f =~ /require\.build\.js$/ }.map do |path_with_filename|
      filename = path_with_filename.gsub(/^#{root_path}\/?/, '').gsub(/\.coffee$/, '')
      filename = "#{filename}.js" unless File.extname(filename) == ".js"
      filename
    end

    Rails.application.config.assets.precompile += modules
  end

end
