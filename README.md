blkid
=====

## usage

```coffeescript
blkid = require 'blkid'
  
blkid.all (partitions) ->
  # [{
  #   partition : '/dev/sdx',
  #   uuid      : 'xxx',
  #   uuid_sub  : 'xxx',
  #   type      : 'fs-type',
  #   partlabel : 'primary',
  #   partuuid  : 'xxx'
  # }]

blkid.partitions ['/dev/sda1'], (partitions) -> 
# will output the infos for sda1
  

blkid.devices (devices) -> # ['sda', 'sdb', 'sdc', 'sdx']
