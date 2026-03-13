# ============================================
# macro:cmd/effect_give_all
# ============================================
# Gives the same effect to all online players at once.
# Difference from macro:cmd/effect_give: no player name needed.
#
# Usage scenarios:
# - Give Speed to everyone at round start
# - Give Blindness to everyone during cutscene
# - Give Saturation to everyone when game ends
#
# INPUT: macro:input
# effect : <string> — Effect id (minecraft:speed etc.)
# duration : <int> — Duration (seconds; 0 = infinite)
# amplifier : <int> — Power level (0 = level 1)
# hide : <string> — "true" | "false" — hide particles
#
# EXAMPLE:
# data modify storage macro:input effect set value "minecraft:slowness"
# data modify storage macro:input duration set value 10
# data modify storage macro:input amplifier set value 2
# data modify storage macro:input hide set value "true"
# function macro:cmd/effect_give_all with storage macro:input {}
# ============================================

$effect give @a $(effect) $(duration) $(amplifier) $(hide)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/effect_give_all ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(effect)","color":"aqua"}]
