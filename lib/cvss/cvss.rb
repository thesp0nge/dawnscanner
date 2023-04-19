require 'cvss/parser'
require 'cvss/helpers'

module Cvss
  class Engine
    include Cvss::Parser
    include Cvss::Helpers

    def score(vector)
      # AV
      #   L = 0.395
      #   A = 0.646
      #   N = 1
      # AC
      #   H = 0.35
      #   M = 0.61
      #   L = 0.71
      # AU
      #   M = 0.45
      #   S = 0.56
      #   N = 0.704
      # C
      #   N = 0
      #   P = 0.275
      #   C = 0.660
      # I
      #   N = 0
      #   P = 0.275
      #   C = 0.660
      # A
      #   N = 0
      #   P = 0.275
      #   C = 0.660
      return -1 unless parse(vector)
      av = {:L => 0.395, :A=> 0.646, :N=>1}
      ac = {:H => 0.35, :M=>0.61, :L=>0.71}
      au = {:M=>0.45, :S=>0.56, :N=>0.704 }

      exploitability = 20 * av[@base[:av].to_sym] * ac[@base[:ac].to_sym] * au[@base[:au].to_sym]
      c = {:N=>0, :P=>0.275, :C=>0.660}
      i = {:N=>0, :P=>0.275, :C=>0.660}
      a = {:N=>0, :P=>0.275, :C=>0.660}

      impact = 10.41 * (1 - (1-c[@base[:c].to_sym]) * (1-i[@base[:i].to_sym]) * (1-a[@base[:a].to_sym]))
      f = 0
      f = 1.176 unless impact == 0

      (((0.6 * impact) + (0.4*exploitability) - 1.5) * f).round(1)

    end
  end
end
