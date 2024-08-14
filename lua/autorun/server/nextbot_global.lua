ScareHealthThreshold = CreateConVar("pvox_nextbot_scared_threshold", "100000", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "The health threshold at which an entity is considered 'Scared'", 0, 1000000)
RegularRadius        = CreateConVar("pvox_nextbot_scared_radius", "650", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "A majority of scariness functionality depends on this value.", 0, 1000000)

function Scary(ent)
    if ! ent then return end
    if ! IsValid(ent) then return end
    -- the requirements for an entity to be considered "Scary"
    return ent:Health() > ScareHealthThreshold:GetInt()
end
