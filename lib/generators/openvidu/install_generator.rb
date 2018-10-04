require 'rails/generators/base'
require 'generators/openvidu/helpers'

module Openvidu
  module Generators

    class InstallGenerator < Rails::Generators::Base
      include Openvidu::Generators::Helpers

      source_root File.expand_path('../templates', __FILE__)

      desc "Generates initializer for openvidu"

       # Copy the initializer file to config/initializers folder.
      def copy_initializer_file
        template "initializer.rb", openvidu_config_path
      end

    end

  end
end