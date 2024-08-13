-- teammate module

--- @param ent NPC
hook.Add("OnNPCKilled", "CheckOnTeammates", function (ent, attacker, inflictor)
    if ! Scary(attacker) then return end
    if attacker == ent then return end

    local players_inRadius = ents.FindInSphere(ent:GetPos(), 650)

    --- @param ply Player
    for _, ply in pairs(players_inRadius) do
        if ! ply:IsPlayer() then continue end
        if ! ply:Alive() then continue end

        if (ent:Disposition(ply) == D_LI || ent:Disposition(ply) == D_NU) then
            -- express concern for teammate

            --- @type PVOX_ModuleBaseClass
            local pmod = PVox:GetPlayerModule(ply)
            if ! pmod then continue end

            pmod:EmitAction(ply, "scared-teammate-down", true, 3)
        end
    end
end)

print("PVOX nextbot killing module loaded")
