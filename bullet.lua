--[[
Bullet is a physics object representing the player's forward shot.
--]]
local LEFT = 0
local TOP = 0
local RIGHT = 256
local BOTTOM = 192

local Bullet = {
  x = 0,
  y = 0,
  dx = 0,
  dy = 0
}

function Bullet:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Bullet:move(dt)
  if self.x > LEFT and self.x < RIGHT then
    self.x = self.x + self.dx * dt
  end
  if self.y > TOP and self.y < BOTTOM then
    self.y = self.y + self.dy * dt
  end
end

function Bullet:ready()
  if self.x <= LEFT or self.x >= RIGHT then
    return true
  end
  if self.y <= TOP or self.y >= BOTTOM then
    return true
  end
end

return Bullet
