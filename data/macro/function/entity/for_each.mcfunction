# ============================================
# macro:entity/for_each
# ============================================
# For each entity with specified type and tag AS and
# o entity'nin AT istenen fonksiyonu calistirir.
# macro:lib/for_each_entity ile aynidir; entity/ modulu
# altinda erisilebilir alias.
#
# INPUT: macro:input
# type : <string> — Entity type
# tag : <string> — Entity tag
# func : <string> — Her entity for run edilecek fonksiyon (namespace:path)
#
# EXAMPLE:
# data modify storage macro:input type set value "minecraft:armor_stand"
# data modify storage macro:input tag set value "display_stand"
# data modify storage macro:input func set value "mymap:stand/update"
# function macro:entity/for_each with storage macro:input {}
# ============================================

$execute as @e[type=$(type),tag=$(tag)] at @s run function $(func)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"entity/for_each ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(type)","color":"aqua"}]
