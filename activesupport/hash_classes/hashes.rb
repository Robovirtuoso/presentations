h = ActiveSupport::OrderedOptions.new
h.one = 1

h = {}

h[:one] = 1
h[:one]
# => 1
#
i = ActiveSupport::InheritableOptions.new(h)
i.one
#=> 1

i.two = 2
