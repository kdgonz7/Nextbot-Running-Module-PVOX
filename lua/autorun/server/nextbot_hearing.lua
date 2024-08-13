-- "hearing" nextbots

--- @param data EmitSoundInfo
hook.Add("EntityEmitSound", "HearingModule", function (data)
    -- these are the nearby players to that specific sound
    if ! data then return end
    if ! data.Pos then return end
    if ! data.Entity then return end

    local nearbyPlayers = ents.FindInSphere(data.Pos, RegularRadius:GetInt())

    --- @param ply Player
    for _, ply in pairs(nearbyPlayers) do
        if ! ply:IsPlayer() then continue end
        if ! ply:Alive() then continue end
        if ! Scary(data.Entity) then continue end
        if ply:Visible(data.Entity) then continue end

        --- @type PVOX_ModuleBaseClass
        local pmod = PVox:GetPlayerModule(ply)
        if ! pmod then continue end
        if pmod:IsEmitting(ply) then continue end

        pmod:EmitAction(ply, "scared-hear-trigger", false, 3)
    end
end)
