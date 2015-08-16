game = {}

function game.load()
  -- time since game was loaded
  game.clock = 0
end

function game.draw()
  -- 32 is the width of the tiles
  for i = 0,4 do
    for j = -1,4 do
      love.graphics.draw(imgs["background"],
                         i*32*scale,
                         (j + game.clock % 1)*32*scale,
                         0, scale, scale
                        )
    end
  end
end

function game.update(dt)

end

function game.kepressed(key)

end
