# ============================================
# macro:cmd/other/multi_cmd/internal/step
# ============================================
# _mcmd_list'i birer birer iter eder.
# Her komut string'i {current_cmd:"..."} compound'una
# sarılır; ardından $execute run $(current_cmd) makrosu
# çalışır.
#
# Çağrı: function macro:cmd/other/multi_cmd/internal/step
# Ön koşul: macro:engine _mcmd_list dolu olmalı
# ============================================

# Liste boşaldıysa dur
execute unless data storage macro:engine _mcmd_list[0] run return 0

# İlk elemanı compound'a sar (makro için key gerekli)
data modify storage macro:engine _mcmd_entry set value {}
data modify storage macro:engine _mcmd_entry.current_cmd set from storage macro:engine _mcmd_list[0]
data remove storage macro:engine _mcmd_list[0]

# $execute run $(current_cmd) ile komutu çalıştır
function macro:cmd/other/multi_cmd/internal/exec with storage macro:engine _mcmd_entry

# Bir sonraki adım
function macro:cmd/other/multi_cmd/internal/step
