local prefabs =
{
    "tumbleweed",
}

local assets = {
    Asset("ANIM", "anim/lightning_rod_placer.zip"),
}

local SCALE = 0.5

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst:AddTag("CLASSIFIED")
    inst:AddTag("NOCLICK")
    inst:AddTag("FX")

    inst.Transform:SetScale(SCALE, SCALE, SCALE)
    
    inst.AnimState:SetBank("lightning_rod_placer")
    inst.AnimState:SetBuild("lightning_rod_placer")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
    
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("childspawner")
    inst.components.childspawner.childname = "tumbleweed"
    inst.components.childspawner:SetMaxChildren(math.random(TUNING.MIN_TUMBLEWEEDS_PER_SPAWNER,TUNING.MAX_TUMBLEWEEDS_PER_SPAWNER))
    inst.components.childspawner:SetSpawnPeriod(math.random(TUNING.MIN_TUMBLEWEED_SPAWN_PERIOD, TUNING.MAX_TUMBLEWEED_SPAWN_PERIOD))
    inst.components.childspawner:SetRegenPeriod(TUNING.TUMBLEWEED_REGEN_PERIOD)
    inst.components.childspawner.spawnoffscreen = true
    inst:DoTaskInTime(0, function(inst)
        inst.components.childspawner:ReleaseAllChildren()
        inst.components.childspawner:StartSpawning()
    end)
    return inst
end

return Prefab("tumbleweedspawner", fn, assets, prefabs)
