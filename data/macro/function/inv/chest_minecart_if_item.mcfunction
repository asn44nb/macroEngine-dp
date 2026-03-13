# ============================================
# macro:inv/chest_minecart_if_item
# ============================================
# For each player in @a AS and AT:
# 2 blok mesafede, belirtilen tag'e sahip chest_minecart'in
# belirtilen container slotunda custom_data'ya sahip item
# VARSA belirtilen command run eder.
#
# Usage scenarios:
# - Item teslim alindiysa odul ver
# - Open door when correct item is plopened
# - Envanterde beklenen kargo var mi kontrol et
#
# INPUT: macro:input
# tag : <string> -- Chest minecart entity tag'i
# slot : <int> -- Container slot (0-26)
# customData : <snbt> -- Aranopenak custom_data SNBT ({...})
# opention : <string> -- Command to run if condition is met
#
# EXAMPLE:
# data modify storage macro:input tag set value "puzzle_cart"
# data modify storage macro:input slot set value 13
# data modify storage macro:input customData set value "{id:\"mymap:key_item\"}"
# data modify storage macro:input invoke set value "setblock ~ ~1 ~ minecraft:air"
# function macro:inv/chest_minecart_if_item with storage macro:input {}
# ============================================

$execute as @a at @s if items entity @e[type=minecraft:chest_minecart,distance=..2,limit=1,tag=$(tag)] container.$(slot) *[minecraft:custom_data=$(customData)] run $(invoke)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"inv/chest_minecart_if_item ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]
