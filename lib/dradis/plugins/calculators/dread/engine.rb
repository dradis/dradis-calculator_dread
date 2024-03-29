module Dradis::Plugins::Calculators::DREAD
  class Engine < ::Rails::Engine
    isolate_namespace Dradis::Plugins::Calculators::DREAD

    include Dradis::Plugins::Base
    provides :addon
    description 'Risk Calculators: DREAD'

    addon_settings :calculator_dread do
      settings.default_show = 1
    end

    initializer 'calculator_dread.asset_precompile_paths' do |app|
      app.config.assets.precompile += [
        'dradis/plugins/calculators/dread/manifests/application.css',
        'dradis/plugins/calculators/dread/manifests/application.js',
        'dradis/plugins/calculators/dread/manifests/tylium.js'
      ]
    end

    initializer "calculator_dread.inflections" do |app|
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym('DREAD')
      end
    end

    initializer 'calculator_dread.mount_engine' do
      Rails.application.routes.append do
        mount Dradis::Plugins::Calculators::DREAD::Engine => '/', as: :dread_calculator
      end
    end

  end
end
