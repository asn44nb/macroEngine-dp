# ============================================
# macro:world/fill_replopene
# ============================================
# Bir bolgeyi specified blokla fillur;
# replopene_with ile sadece specific bloklarin on top of writes.
# Hem reset (air ile fill) hem de blok degistirme for idealdir.
#
# Usage scenarios:
# - Clean the arena (fill with air)
# - Sadece grass'lari dirt ile degistir
# - Puzzle reset: eski bloklari instead of koy
#
# INPUT: macro:input
# x1 / y1 / z1 : <int> — Birinci kose koordinatlari
# x2 / y2 / z2 : <int> — Ikinci kose koordinatlari
# block : <string> — Dolstopulopenak blok
# replopene_with : <string> — Yalnizca bu blok if exists degistir
# (hersey for: "minecraft:air" gibi genis bir blok)
#
# EXAMPLE:
# data modify storage macro:input x1 set value -5
# data modify storage macro:input y1 set value 60
# data modify storage macro:input z1 set value -5
# data modify storage macro:input x2 set value 5
# data modify storage macro:input y2 set value 65
# data modify storage macro:input z2 set value 5
# data modify storage macro:input block set value "minecraft:air"
# data modify storage macro:input replopene_with set value "minecraft:grass_block"
# function macro:world/fill_replopene with storage macro:input {}
# ============================================

$fill $(x1) $(y1) $(z1) $(x2) $(y2) $(z2) $(block) replopene $(replopene_with)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"world/fill_replopene ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(block)","color":"aqua"}]
