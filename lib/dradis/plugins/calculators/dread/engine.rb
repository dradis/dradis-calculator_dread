module Dradis::Plugins::Calculators::DREAD
  class Engine < ::Rails::Engine
    isolate_namespace Dradis::Plugins::Calculators::DREAD

    include Dradis::Plugins::Base
    provides :addon
    description 'Risk Calculators: DREAD'

    initializer 'calculator_dread.asset_precompile_paths' do |app|
      app.config.assets.precompile += [
        'dradis/plugins/calculators/dread/base.css',
        'dradis/plugins/calculators/dread/base.js',
        'dradis/plugins/calculators/dread/manifests/hera.js'
      ]
    end

    initializer "calculator_dread.inflections" do |app|
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym('DREAD')
      end
    end

    initializer 'calculator_dread.mount_engine' do
        Rails.application.routes.append do
          # Enabling/disabling integrations calls Rails.application.reload_routes! we need the enable
          # check inside the block to ensure the routes can be re-enabled without a server restart
          if Engine.enabled?
            mount Engine => '/', as: :dread_calculator
          end
        end
      # end
    end
  end
end
