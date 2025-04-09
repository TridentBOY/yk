local oldfromOrientation; oldfromOrientation = hookfunction(CFrame.fromOrientation, newcclosure(function(p, y, r)
    if VisualsWTFConfig.silent and getgenv().SilentTarget and debug.info(3, "n") == "fire" then
        local id, speed, drop = ProjectileDrop()
        local targetHead = getgenv().SilentTarget.model.Head
        if targetHead then
            local origin = modules.Camera.GetCFrame()
            local Camera = game.workspace.CurrentCamera
            local cameraPosition = Camera.CFrame.Position
            local predictedPos = PerfectPrediction(origin.Position, targetHead.Position, speed, drop)
            if predictedPos then
                return Camera.CFrame:Inverse() * CFrame.lookAt(cameraPosition, predictedPos)
            end
        end
    end
    return oldfromOrientation(p, y, r)
end))
