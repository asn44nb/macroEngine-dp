# ============================================
# macro:perm/run
# ============================================
# İzin kontrolü yaparak komutu belirtilen oyuncu OLARAK ve
# oyuncunun KONUMUNDA çalıştırır.
# macro.admin tag kontrolü de dahildir.
#
# Pid-based targeting: @a[name=...] yerine macro.pid scoreboard
# kullanılır — offline-mode sunucularda duplicate-name güvenlidir.
#
# INPUT: macro:input { player:"<n>", perm:"<izin_adi>", cmd:"<komut>" }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input perm set value "builder"
# data modify storage macro:input cmd set value "setblock ~ ~ ~ stone"
# function macro:perm/run with storage macro:input {}
# ============================================

# ─── Resolve pid (sıfırla + oku; path yoksa 0 kalır) ──────────
scoreboard players set $pr_pid macro.tmp 0
$execute store result score $pr_pid macro.tmp run data get storage macro:engine player_pids.$(player)
execute if score $pr_pid macro.tmp matches 0 run return 0

# ─── Permission check (pid-based — no name= selector) ─────────
data modify storage macro:engine _pr_tmp set value {result:0b}
execute as @a if score @s macro.pid = $pr_pid macro.tmp run execute if entity @s[tag=macro.admin] run data modify storage macro:engine _pr_tmp.result set value 1b
$execute as @a if score @s macro.pid = $pr_pid macro.tmp run execute if entity @s[tag=perm.$(perm)] run data modify storage macro:engine _pr_tmp.result set value 1b

# ─── Permission denied → notify player and abort ──────────────
$execute if data storage macro:engine _pr_tmp{result:0b} run execute as @a if score @s macro.pid = $pr_pid macro.tmp run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" iznine sahip değilsiniz.","color":"red"}]
execute if data storage macro:engine _pr_tmp{result:0b} run return 0

# ─── Permission granted → execute command as and at player ────
$execute as @a if score @s macro.pid = $pr_pid macro.tmp at @s run $(cmd)

data remove storage macro:engine _pr_tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/run ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [","color":"#555555"},{"text":"$(perm)","color":"green"},{"text":"] → ","color":"#555555"},{"text":"$(cmd)","color":"aqua"}]
