# ============================================
# macro:cmd/other/run_self
# ============================================
# Herhangi bir komutu belirtilen oyuncu OLARAK ve
# oyuncunun KONUMUNDA çalıştırır.
# INPUT: macro:input { cmd:"<komut>" }
# ÖRNEK:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input cmd set value "effect give @s speed 5 2 true"
# function macro:cmd/other/run_self with storage macro:input {}
# ============================================

$execute as @s[type=minecraft:player] at @s run $(cmd)
