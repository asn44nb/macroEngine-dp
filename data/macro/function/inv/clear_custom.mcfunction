# ============================================
# macro:inv/clear_custom
# ============================================
# Oyuncunun inventoryindeki belirtilen custom_data'ya sahip
# item'lari belirtilen miktarda deleteer.
# count: 0 → hepsini delete; pozitif counti → o kadar delete.
#
# Usage scenarios:
# - Odeme al (N adet coin delete)
# - Delete quest item after delivery
# - Destroy single-use item after use
#
# INPUT: macro:input
# player : <string> — Player name
# customData : <snbt> — Silinecek item custom_data SNBT ({...})
# count : <int> — Silinecek miktar (0 = hepsi)
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input customData set value "{id:\"mymap:gold_coin\"}"
# data modify storage macro:input count set value 5
# function macro:inv/clear_custom with storage macro:input {}
# ============================================

$execute as @a[name=$(player),limit=1] run clear @s *[minecraft:custom_data=$(customData)] $(count)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"inv/clear_custom ","color":"aqua"},{"text":"$(player)","color":"white"}]
