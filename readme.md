# Love2D Entities

Attempt to create a simple Entity System with **Love2D**.

---

## How to instantiate an Entity :

* First, require the `entity` module :
```Lua
-- Modules
local Entity = require('entity')
```

* Then, create the instance of the entity :
```Lua
local myEntity = {}
function love.load()
    -- Entity constructor : 
    -- (name, x, y, max_speed, animationSpeed, direction, state, spriteFormat)
    myEntity = Entity.new('player', 150, 195, 10, 17.5, 1, 'walk', {8, 1})
end
```


--- 
[`name`] corresponds to the name of our entity.
The properties [`x`] & [`y`] allows to set the Entity position.
[`max_speed`] will be the maximum speed the entity could move.
[`state`] corresponds to the current state of our entity.

Our entity contains an `AnimatedSprite` instance.

[`'player'`] corresponds to the filename prefix (and it is the `name` of our entity), in this case its our player.
[`'walk'`] corresponds to the filename suffix (and it is the `state` of our entity), in this case, our entity is walking.

For now, an AnimatedSprite reads only the files with a `.png` extension, and uses a separator between the name and the state : `'_'`.

With this informations, we know our loaded file corresponds to :
`'player_walk.png'`.
[`animation_speed`] allows the control of the `AnimatedSprite` animation speed.

[`direction`] will in later versions allow to flip our sprite in function of its direction.

[`spriteFormat`] is a table, containing the number of lines & the number of columns of the `AnimatedSprite` spritesheet.

*Example :* 
```Lua
-- For a 10 columns spritesheet by 8 lines our table will be :
{10, 8}
```

## Draw and update

* In order to update the entity position & behavior, we need to call the `update(dt)` method of the instance in our `love.update(dt)` :
```Lua
function love.update(dt)
    myEntity:update(dt)
end
```

* It is the same to draw the entity, we call the `draw()` method of the instance in our `love.draw()` :

```Lua
function love.draw()
    myEntity:draw()
end
```

--- 

# Purpose 

This is an incomplete prototype. I want to learn how to implement a simple Entity system under **Love2D**, it is still a WIP.

I need to implement a state machine, a container for all the entities, a 'World' container, and so on.