require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

require 'gilded_rose'

module MiniTest
  class Spec
    class << self
      alias_method :context, :describe
    end
  end
end