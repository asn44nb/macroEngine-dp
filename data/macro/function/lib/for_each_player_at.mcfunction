# ============================================
# macro:lib/for_each_player_at
# ============================================
# Run function AS and AT each online player.
# INPUT: macro:input { func:"<namespace:path>" }
# ============================================

$execute as @a at @s run function $(func)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/for_each_player_at ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
