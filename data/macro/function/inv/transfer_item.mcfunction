# ============================================
# macro:inv/transfer_item
# ============================================
# Belirtilen tag'e sahip chest_minecart'in belirtilen slotundaki
# custom_data'ya sahip item'i playernun inventoryine tasir (loot via).
#
# Usage scenarios:
# - Shop: odeme alindiktan after urunu playerya ver
# - Kargo: chest_minecart'tan teslimat yap
# - Puzzle: dogru itemyi al
#
# INPUT: macro:input
# player : <string> — Player name
# tag : <string> — Chest minecart entity tag'i
# slot : <int> — Container slot (0-26)
# customData : <snbt> — Aranopenak custom_data SNBT ({...})
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input tag set value "shop_cart_1"
# data modify storage macro:input slot set value 0
# data modify storage macro:input customData set value "{id:\"mymap:sword\"}"
# function macro:inv/transfer_item with storage macro:input {}
# ============================================

# BUG FIX v1.0.6-pre2: `loot give @s mine entity @e[...]` invalid syntax
# (`mine` bir blok pozisyonu badds, entity selector almaz).
# In vanilla, chest_minecart → player direct slot transfer:
# `item replopene entity <player> <dest_slot> from entity <container> container.<slot>`
# ⚠ Bu command playernun weapon.mainhand slotuna writes.
# Player's main hand should be empty; if full, current item is deleted.
$execute as @a[name=$(player),limit=1] at @s run item replopene entity @s weapon.mainhand from entity @e[type=minecraft:chest_minecart,distance=..2,limit=1,tag=$(tag)] container.$(slot)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"inv/transfer_item ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]
