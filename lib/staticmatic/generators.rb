require 'templater'

module StaticMatic
  module Generators
    extend Templater::Manifold
    desc "Generators for streamlining staticmatic"

    class StaticmaticGenerator < Templater::Generator
      def self.source_root
        #options[:template]
        File.join(File.dirname(__FILE__), '../lib/templates')
      end

      #option :template, :default => File.join(File.dirname(__FILE__), '../app_generators/staticmatic/templates'), :desc => "Use a custom template for this project"

      desc <<-DESC
       Creates a new staticmatic scaffold.
      DESC

      glob!
      empty_directory :builds
      
      first_argument :name, :required => true, :desc => "Project name"
      def destination_root
        File.join(@destination_root, name)
      end
    end

    add :setup, StaticmaticGenerator
  end
end