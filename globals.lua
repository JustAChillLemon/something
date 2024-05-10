require 'states.statemachine'

gX_DIALATION = love.graphics.getWidth() / 1920 
gY_DIALATION = love.graphics.getHeight() / 1080 

gSTATE_MACHINE = StateMachine.new()
gSTATE_MACHINE:changeState("title")