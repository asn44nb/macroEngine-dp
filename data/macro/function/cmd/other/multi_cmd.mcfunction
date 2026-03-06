$data modify storage macro:engine _mcmd_list set value $(commands)

execute at @s run function macro:cmd/other/multi_cmd/run
