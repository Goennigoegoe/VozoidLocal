function Alive(Player)
    if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") ~= nil and Player.Character:FindFirstChild("Humanoid") ~= nil and Player.Character:FindFirstChild("Head") ~= nil and
    Player:FindFirstChild("LeftFoot") ~= nil and Player:FindFirstChild("RightFoot") ~= nil and Player:FindFirstChild("RightUpperArm") ~= nil and Player:FindFirstChild("LeftUpperArm") ~= nil and
    Player:FindFirstChild("Humanoid").Health > 0 then
        return true;
    end
    return false;
end

--local w2s = workspace.CurrentCamera.worldToViewportPoint;

function w2s(pos)
    local twodPos = workspace.CurrentCamera:WorldToViewportPoint(pos);
    return twodPos;
end

local library = {
    boxEsp = false;
};
library.__index = library;

for i,v in pairs(game.Players:GetChildren()) do
    local box = Drawing.new("Square");
    box.Visible = false;
    box.Transparency = 1;
    box.Color = Color3.new(255, 255, 255);
    box.Thickness = 1;
    box.Size = Vector2.new(0, 0);
    box.Position = Vector2.new(0, 0);
    box.Filled = false;

    function doBoxEsp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if Alive(v) and library.boxEsp then
                local vector, onScreen = w2s(v.Character:FindFirstChild("HumanoidRootPart").Position);

                local head = v.Character:FindFirstChild("Head");
                local rFoot = v.Character:FindFirstChild("RightFoot");

                local rArm = v.Character:FindFirstChild("RightArm");
                local lArm = v.Character:FindFirstChild("LeftArm");

                local padding = (1000 / vector.Z) / 20;

                if onScreen then
                    local headPos = w2s(head.Position);

                    local rFootPos = w2s(rFoot.Position);

                    local lArmPos = w2s(lArm.Position);
                    local rArmPos = w2s(rArm.Position);

                    boxSizeX = (rArmPos.X - lArmPos.X) + padding;
                    boxSizeY = (rFootPos.Y - headPos.Y) + (padding / 2);

                    boxPosX = lArmPos.X - (padding / 2);
                    boxPosY = headPos.Y + (padding / 4);

                    box.Size = Vector2.new(boxSizeX, boxSizeY);
                    box.Position = Vector2.new(boxPosX, boxPosY);
                    
                    box.Visible = true;
                else
                    box.Visible = false;
                end
            else
                box.Visible = false;
            end
        end)
    end
    coroutine.wrap(doBoxEsp);
end

game.Players.PlayerAdded:Connect(function(v)
    local box = Drawing.new("Square");
    box.Visible = false;
    box.Transparency = 1;
    box.Color = Color3.new(255, 255, 255);
    box.Thickness = 1;
    box.Size = Vector2.new(0, 0);
    box.Position = Vector2.new(0, 0);
    box.Filled = false;

    function doBoxEsp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if Alive(v) and library.boxEsp then
                local vector, onScreen = w2s(v.Character:FindFirstChild("HumanoidRootPart").Position);

                local head = v.Character:FindFirstChild("Head");
                local rFoot = v.Character:FindFirstChild("RightFoot");

                local rArm = v.Character:FindFirstChild("RightArm");
                local lArm = v.Character:FindFirstChild("LeftArm");

                local padding = (1000 / vector.Z) / 20;

                if onScreen then
                    local headPos = w2s(head.Position);

                    local rFootPos = w2s(rFoot.Position);

                    local lArmPos = w2s(lArm.Position);
                    local rArmPos = w2s(rArm.Position);

                    boxSizeX = (rArmPos.X - lArmPos.X) + padding;
                    boxSizeY = (rFootPos.Y - headPos.Y) + (padding / 2);

                    boxPosX = lArmPos.X - (padding / 2);
                    boxPosY = headPos.Y + (padding / 4);

                    box.Size = Vector2.new(boxSizeX, boxSizeY);
                    box.Position = Vector2.new(boxPosX, boxPosY);
                    
                    box.Visible = true;
                else
                    box.Visible = false;
                end
            else
                box.Visible = false;
            end
        end)
    end
    coroutine.wrap(doBoxEsp);
end)

return setmetatable({}, library);
