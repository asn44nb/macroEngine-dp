# ============================================
# macro:entity/summon_at_player
# ============================================
# Spawns an entity at the exact location of the specified player.
# Difference from macro:cmd/summon: instead of giving coordinates
# player name is written; entity appears at the player's location.
#
# Usage scenarios:
# - Spawn enemy on top of player
# - Create effect entity at player's location
# - Summon NPC right next to player
#
# INPUT: macro:input
# player : <string> — Player name
# entity : <string> — Entity type (minecraft:zombie etc.)
# nbt : <snbt> — Entity NBT ({} empty form)
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input entity set value "minecraft:lightning_bolt"
# data modify storage macro:input nbt set value "{}"
# function macro:entity/summon_at_player with storage macro:input {}
# ============================================

$execute as @a[name=$(player),limit=1] at @s run summon $(entity) ~ ~ ~ $(nbt)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"entity/summon_at_player ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(entity)","color":"aqua"}]
