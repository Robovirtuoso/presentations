class Matchbox
  include ActiveSupport::Configurable

  config_accessor :color, :speed

  config_accessor :driver do
    NullDriver.new
  end

  configure do |c|
    c.each do |key, value|
      # do stuff
    end
  end

  def slow_down?
    speed > 3
  end

end

m = Matchbox.new

m.color = 'red'
m.speed = 5
m.type = 'not plastic'

m.config.type = 'plastic buggatti'
m.config.drive_ready = true
