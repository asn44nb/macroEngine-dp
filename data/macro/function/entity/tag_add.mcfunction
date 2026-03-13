# ============================================
# macro:entity/tag_add
# ============================================
# Belirtilen type ve current tag'e sahip all entitylere
# yeni bir tag adds.
#
# Usage scenarios:
# - Dalga 2'deki mobler for "elite" tag ekle
# - Belirli all NPC'leri "active" olarak isaretle
# - Filtreli grup etiketleme
#
# INPUT: macro:input
# type : <string> — Entity type
# filter : <string> — Mevcut tag (filtreleme for)
# new_tag : <string> — Eklenecek yeni tag
#
# EXAMPLE:
# data modify storage macro:input type set value "minecraft:zombie"
# data modify storage macro:input filter set value "wave_1"
# data modify storage macro:input new_tag set value "elite"
# function macro:entity/tag_add with storage macro:input {}
# ============================================

$tag @e[type=$(type),tag=$(filter)] add $(new_tag)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"entity/tag_add ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(type)","color":"aqua"}]
