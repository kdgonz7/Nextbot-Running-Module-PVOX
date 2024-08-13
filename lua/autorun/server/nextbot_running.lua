-- nextbot fearing module

-- probably just going to use
-- a simple EmitAction here

local Enabled = CreateConVar("pvox_nextbot_enabled", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Should the nextbot fear system be Enabled?", 0, 1)

hook.Add("Tick", "CheckAndEmitRunIfScared", function ()
    if ! Enabled:GetBool() then return end

    -- check if there are any nextbots
    --! probably need to change this, speed is O(N^2)
    --- @param ply Player
    for _, ply in player.Iterator() do
        if ! ply:Alive() then continue end

        --- @param ent NextBot
        for _, ent in pairs(ents.FindInSphere(ply:GetPos(), 650)) do
            if ! Scary(ent) then continue end
            if ! ply:Visible(ent) then continue end
            if ! ent:Visible(ply) then continue end

            --- @type PVOX_ModuleBaseClass
            local pmod = PVox:GetPlayerModule(ply)
            
            if ! pmod then continue end
            if pmod:IsEmitting(ply) then continue end

            pmod:EmitAction(ply, "scared", false, 3)

            break
        end
    end
end)

print("PVOX nextbot running module loaded")
