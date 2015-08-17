game = {}

function game.load()
  -- time since game was loaded
  game.clock = 0

  game.enemy_size = imgs["enemy"]:getWidth()
  game.enemies = {}
  game.enemy_dt = 0
  game.enemy_rate = 2

  game.player_size = imgs["player"]:getWidth()
  game.playerx = (160/2)*scale
  game.playery = (144-12)*scale
end

function game.draw()
  -- 32 is the width of the tiles
  -- (j + game.clock % 1)*32*scale dynamically moves tiles down across screen
  for i = 0,4 do
    for j = -1,4 do
      love.graphics.draw(imgs["background"],
                         i*32*scale,
                         (j + game.clock % 1)*32*scale,
                         0, scale, scale
                        )
    end
  end

  for _,v in ipairs(game.enemies) do
    love.graphics.draw(imgs["enemy"],
                       v.x, v.y,
                       0, scale, scale,
                       game.enemy_size/2,
                       game.enemy_size/2
                      )

    if debug then
      love.graphics.circle("line", v.x, v.y, game.enemy_size/2*scale)
    end

  end

  love.graphics.draw(imgs["player"],
                     game.playerx, game.playery,
                     0, scale, scale,
                     game.player_size/2,
                     game.player_size/2
                    )

  if debug then
    love.graphics.circle("line", game.playerx, game.playery, game.player_size/2*scale)
  end
end

function game.update(dt)
  game.clock = game.clock + dt

  game.enemy_dt = game.enemy_dt + dt

  if game.enemy_dt > game.enemy_rate then
    game.enemy_dt = game.enemy_dt - game.enemy_rate
    game.enemy_rate = game.enemy_rate - 0.01 * game.enemy_rate
    local enemy = {}
    -- 8 is half enemy size
    enemy.x = math.random((8)*scale, (160 - 8)*scale)
    enemy.y = -game.enemy_size
    table.insert(game.enemies, enemy)
  end

  for ei, ev in ipairs(game.enemies) do
    -- 70 pixels per second movement speed
    ev.y = ev.y + 70*dt*scale
    -- remove enemies that go past bottom of screen
    if ev.y > 144*scale then
      table.remove(game.enemies, ei)
    end
  end
end

function game.keypressed(key)

end
