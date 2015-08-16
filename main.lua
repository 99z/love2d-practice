debug = false
require('splash')

function love.load()
  img_fn = {"bullet", "enemy", "player", "title", "background"}
  imgs = {}

  for _,v in ipairs(img_fn) do
    imgs[v] = love.graphics.newImage("assets/" ..v.. ".gif")
  end

  -- setting scaling filter
  for _,v in pairs(imgs) do
    v:setFilter("nearest", "nearest")
  end

  music = love.audio.newSource("assets/music.ogg", "stream")
  music:setLooping(true)
  love.audio.play(music)

  shoot = love.audio.newSource("assets/shoot.ogg", "static")

  font = love.graphics.newFont("assets/font.ttf", 14*scale)
  love.graphics.setFont(font)

  bgcolor = {r = 148, g = 191, b = 19}
  fontcolor = {r = 46, g = 115, b = 46}

  state = "splash"
  splash.load()
end

function love.draw()
  love.graphics.setColor(bgcolor.r, bgcolor.g, bgcolor.b)

  love.graphics.rectangle("fill",
                          0, 0,
                          love.graphics.getWidth(),
                          love.graphics.getHeight()
                         )

  love.graphics.setColor(255, 255, 255)

  if state == "splash" then
    splash.draw()
  end
end

function love.update(dt)
  if state == "splash" then
    splash.update(dt)
  end
end

function love.keypressed(key)
  if state == "splash" then
    splash.keypressed(key)
  end

  if key == "`" then
    debug = not debug
  end
end
