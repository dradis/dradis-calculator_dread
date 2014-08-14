module Dradis::Plugins::Calculators::DREAD
  class Engine < ::Rails::Engine
    isolate_namespace Dradis::Plugins::Calculators::DREAD

    include Dradis::Plugins::Base
    provides :addon
    description 'Provides a DREAD score calculator under /calculators/dread'


    initializer "calculator_dread.inflections" do |app|
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym('DREAD')
      end
    end

    initializer 'calculator_dread.mount_engine' do
      Rails.application.routes.append do
        mount Dradis::Plugins::Calculators::DREAD::Engine => '/calculators/', as: :dread_calculator
      end
    end

  end
end