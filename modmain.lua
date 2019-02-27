-- local SCALE = 2.53
-- local Prefabs = GLOBAL.Prefabs
-- AddClassPostConstruct("prefabs/tumbleweedspawner", function()
--     table.insert(Prefabs['tumbleweedspawner'].assets, Asset("ANIM", "anim/lightning_rod_placer.zip"))
-- end)
-- AddPrefabPostInit("tumbleweedspawner", function(inst)
--     inst:AddTag("NOCLICK")
--     inst:AddTag("FX")
--     inst.entity:AddAnimState()
--     inst.Transform:SetScale(SCALE, SCALE, SCALE)
--     inst.AnimState:SetBank("lightning_rod_placer")
--     inst.AnimState:SetBuild("lightning_rod_placer")
--     inst.AnimState:PlayAnimation("idle")
--     inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
--     inst.AnimState:SetLayer(LAYER_BACKGROUND)
--     inst.AnimState:SetSortOrder(3)
-- end)
PrefabFiles = {
    "tumbleweedspawner"
}