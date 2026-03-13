# ============================================
# macro:entity/count
# ============================================
# Writes the count of entities with the specified type and tag
# to macro:output.
#
# Usage scenarios:
# - Count remaining enemies in the wave
# - Learn how many NPCs are active
# - Check entity limit (max 10 etc.)
#
# INPUT: macro:input
# type : <string> — Entity type (minecraft:zombie etc.)
# tag : <string> — Entity tag (use "!nonexistent" to leave empty)
#
# OUTPUT: macro:output { count:<int> }
#
# EXAMPLE:
# data modify storage macro:input type set value "minecraft:zombie"
# data modify storage macro:input tag set value "wave_1"
# function macro:entity/count with storage macro:input {}
# # → macro:output count can be read
# data get storage macro:output count
# ============================================

scoreboard players set $ent_count macro.tmp 0
$execute as @e[type=$(type),tag=$(tag)] run scoreboard players add $ent_count macro.tmp 1
execute store result storage macro:output count int 1 run scoreboard players get $ent_count macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"entity/count ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(type)","color":"aqua"}]
