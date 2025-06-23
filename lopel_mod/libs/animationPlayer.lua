

local data = {}
local currentPos = {0, 0}
local currentAnimation = 0





-- data format:
-- data[i] = {obj, startX, startY, endX, endY, delay, animType}



function addAnimation(anim)
    data[#data+1] = anim
end

function removeAnimation(index)
    for i=index, #data-1 do
        data[i] = data[i+1]
    end
end

function setLocalAnimation(index)
    if index > #data then
        currentAnimation = 0
    else
        currentAnimation = index
    end

    if currentAnimation ~= 0 then
        currentPos = {data[currentAnimation[2]], data[currentAnimation[3]]}
    else
        currentPos = {0, 0}
    end

end





function Game:update(dt)
    if currentAnimation ~= 0 then
        if currentPos[1] == data[currentAnimation][4] then
            currentPos[1] = 0
            currentPos[2] = currentPos[2] + 1
        end

        if currentPos[2] == data[currentAnimation][5] then
            if data[currentAnimation][7] == "loop" then
                setLocalAnimation(currentAnimation)
            else
                setLocalAnimation(0)
            end
        end

        data[currentAnimation][1].children.center:set_sprite_pos(currentPos)
        
    end

end
