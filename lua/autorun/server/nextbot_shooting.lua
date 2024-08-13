--- 
--- @param ent NextBot
--- @param dmginfo CTakeDamageInfo
hook.Add("EntityTakeDamage", "OnNPCTakeDamage", function (ent, dmginfo)
    if ! Scary(ent) then return end
--- @type Entity
    local att = dmginfo:GetAttacker()

---@diagnostic disable-next-line: param-type-mismatch
    local mod = PVox:GetPlayerModule(att)
    if ! mod then return end

---@diagnostic disable-next-line: param-type-mismatch
    if mod:IsEmitting(att) then return end

---@diagnostic disable-next-line: param-type-mismatch
    mod:EmitAction(att, "scared-shot")
end)

print("PVOX nextbot shooting module loaded")
