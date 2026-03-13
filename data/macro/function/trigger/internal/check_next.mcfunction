# ============================================
# macro:trigger/internal/check_next
# ============================================
# _tc_binds listesini birer birer isler.
# For each element: value == $tc_player ise fonksiyon/komutu run eder.
# macro:input'e hic dokunmaz — tick context guvenlidir.
#
# BUG FIX: previously both call and call2 were called unconditionally for each bind.
# Bind sadece func iceriyorsa call2 bos parametreyle calisip hata veriyordu;
# sadece cmd iceriyorsa call bos parametreyle hata veriyordu.
# Duzeltme: if data ile .func ve .cmd varligini kontrol et, sadece mevcut withi calistir.
# ============================================

execute unless data storage macro:engine _tc_binds[0] run return 0

# Mevcut bind'i al
data modify storage macro:engine _tc_current set from storage macro:engine _tc_binds[0]
data remove storage macro:engine _tc_binds[0]

# Read value and compare
execute store result score $tc_val macro.tmp run data get storage macro:engine _tc_current.value

# Match + func field var → fonksiyonu calistir
execute if score $tc_player macro.tmp = $tc_val macro.tmp if data storage macro:engine _tc_current.func run function macro:trigger/internal/call with storage macro:engine _tc_current

# Match + cmd field var → komutu calistir
execute if score $tc_player macro.tmp = $tc_val macro.tmp if data storage macro:engine _tc_current.cmd run function macro:trigger/internal/call2 with storage macro:engine _tc_current

# Sonraki bind
function macro:trigger/internal/check_next
