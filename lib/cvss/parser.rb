module Cvss
  module Parser

    attr_reader :base

    # It parses a string and it says if it's a good CVSS vector or not.
    def parse(string)
      @base = {}

      toks = string.split("/")
      return parse_base(toks)
    end


    private
    # AV:N/AC:L/Au:N/C:N/I:N/A:C
    def parse_base(tokens)
      return false if tokens.count != 6
      av = tokens[0].split(":")
      return false if av.count != 2 or av[0] != "AV" or (av[1] != "N" and av[1] != "L" and av[1] != "A")

      ac = tokens[1].split(":")
      return false if ac.count != 2 or ac[0] != "AC" or (ac[1] != "H" and ac[1] != "M" and ac[1] != "L")
      au = tokens[2].split(":")

      return false if au.count != 2 or au[0] != "Au" or (au[1] != "M" and au[1] != "S" and au[1] != "N")

      c = tokens[3].split(":")
      return false if c.count != 2 or c[0] != "C" or (c[1] != "P" and c[1] != "C" and c[1] != "N")

      i = tokens[4].split(":")
      return false if i.count != 2 or i[0] != "I" or (i[1] != "P" and i[1] != "C" and i[1] != "N")
      
      a = tokens[5].split(":")
      return false if a.count != 2 or a[0] != "A" or (a[1] != "P" and a[1] != "C" and a[1] != "N")


      
      
      @base = {:av=>av[1], :ac=>ac[1], :au=>au[1], :c=>c[1], :i=>i[1], :a=>a[1]}
      true
    end
  end
end
