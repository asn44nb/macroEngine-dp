# ============================================
# macro:config/delete
# ============================================
# Config'den belirli bir key'i removes.
# INPUT: macro:input { key:"<key>" }
# OUTPUT: —
# ============================================

$data remove storage macro:engine config.$(key)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"config/delete ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]
