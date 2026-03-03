# ============================================
# macro:cmd/other/run_self
# ============================================
# Herhangi bir eylemi belirtilen oyuncu OLARAK ve
# oyuncunun KONUMUNDA çalıştırır.
# INPUT: macro:input { cmd:"<komut>" }
# ÖRNEK:
# data modify storage macro:input type set value "as_player"
# data modify storage macro:input arguments.cmd set value "effect give @s speed 5 2 true"
# function macro:cmd/other/run_self with storage macro:input {}
# ============================================

$execute as @a[name=$(player),limit=1] at @s run function macro:cmd/$(type) $(arguments)