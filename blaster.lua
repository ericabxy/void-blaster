--[[
Blaster is a physics object representing the player's gunship.
--]]
LEFT = 0
TOP = 32
RIGHT = 224
BOTTOM = 160

local Blaster = {
  x = 0,
  y = 0,
  dx = 0,
  dy = 0,
  speed = 500,
  max_speed = 100
}

function Blaster:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Blaster:accel(dx, dy)
  if math.abs(self.dx) < self.max_speed then
    self.dx = self.dx + dx * self.speed
  end
  if math.abs(self.dy) < self.max_speed then
    self.dy = self.dy + dy * self.speed
  end
end

function Blaster:decel(dt)
  self.dx = self.dx * 0.90
  self.dy = self.dy * 0.90
end

function Blaster:move(dt)
  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
  if self.x < LEFT then
    self.x = LEFT
    self.dx = 0
  elseif self.x > RIGHT then
    self.x = RIGHT
    self.dx = 0
  end
  if self.y < TOP then
    self.y = TOP
    self.dy = 0
  elseif self.y > BOTTOM then
    self.y = BOTTOM
    self.dy = 0
  end
end

return Blaster
