module Dradis::Plugins::Calculators::DREAD
  # Does it matter that we're inheriting from the no-frills controller?
  class BaseController < ActionController::Base
    def index
      @dread_vector = Hash.new { |h, k| h[k] = 0 }
    end
  end
end