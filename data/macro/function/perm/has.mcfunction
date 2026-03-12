# ============================================
# macro:perm/has
# ============================================
# Playerin izne sahip olup olmadığını kontrol eder.
# macro.admin tag her izni kapsar.
# Online oyuncu: pid tabanlı entity tag (hızlı yol)
# Offline oyuncu: storage fallback
#
# Pid-based targeting: @a[name=...] yerine macro.pid scoreboard
# kullanılır — offline-mode sunucularda duplicate-name güvenlidir.
#
# INPUT:  macro:input  { player:"<n>", perm:"<izin_adi>" }
# OUTPUT: macro:output { result: 1b (var) / 0b (yok) }
# ============================================

data modify storage macro:output result set value 0b

# ─── Resolve pid (sıfırla + oku; path yoksa 0 kalır) ──────────
scoreboard players set $ph_pid macro.tmp 0
$execute store result score $ph_pid macro.tmp run data get storage macro:engine player_pids.$(player)

# ─── Online checks (pid-based entity targeting) ───────────────
# admin tag her izni kapsar
execute as @a if score @s macro.pid = $ph_pid macro.tmp run execute if entity @s[tag=macro.admin] run data modify storage macro:output result set value 1b
# runtime perm tag (online oyuncu için hızlı yol)
$execute as @a if score @s macro.pid = $ph_pid macro.tmp run execute if entity @s[tag=perm.$(perm)] run data modify storage macro:output result set value 1b

# ─── Storage fallback (offline veya tag henüz sync edilmemişse) ─
$execute if data storage macro:engine permissions.$(player).$(perm) run data modify storage macro:output result set value 1b

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/has ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(perm)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
