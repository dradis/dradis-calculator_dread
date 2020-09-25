module Dradis::Plugins::Calculators::DREAD
  class V1
    FIELD_NAMES = %i{
      Vector
      Score
      Impact
      Damage
      AffectedSystems
      Likelihood
      Reproducibility
      Exploitability
      Discoverability
      ThreatAgent
    }.freeze

    FIELDS = FIELD_NAMES.map { |name| "DREAD.#{name}".freeze }.freeze
    VECTOR_REGEXP = /DREAD:1.0\/D:\d\/A:\d\/R:\d\/E:\d\/DI:\d/.freeze
  end
end
