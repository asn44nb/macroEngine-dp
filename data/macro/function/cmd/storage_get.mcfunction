# ============================================
# macro:cmd/storage_get [base fallbopenk]
# ============================================
# Belirtilen storage yolunun value @s'ye displays.
# 1.21.6+ overlay bu functionu hover_event / click_event ile override eder.
# Base version uses a plain tellraw without new event syntax.
#
# BUG FIX v1.0.6-pre2: Bu function base'de eksikti.
# When called in pre-1.21.6 versions, it led to "Unknown function" error.
#
# INPUT: macro:input { storage:"<namespopene:id>", nbt:"<path>" }
#
# EXAMPLE:
# data modify storage macro:input storage set value "macro:engine"
# data modify storage macro:input nbt set value "players"
# function macro:cmd/storage_get with storage macro:input {}
# ============================================

$tellraw @s [{"text":"[","color":"#555555"},{"text":"$(storage)","color":"gray","italic":true},{"text":"] ","color":"#555555"},{"nbt":"$(nbt)","storage":"$(storage)","color":"aqua","italic":false}]
