$data modify storage macro:engine storageGet.storage set value "$(storage)"
$data modify storage macro:engine storageGet.nbt set from storage $(storage) $(nbt)
$data modify storage macro:engine storageGet.copy set from storage $(storage) $(nbt)

function macro:cmd/storage_get with storage macro:engine storageGet