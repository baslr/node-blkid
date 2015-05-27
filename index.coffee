###

blkid -g && blkid

example

partition : '/dev/sdx',
uuid      : 'xxx',
uuid_sub  : 'xxx',
type      : 'fs-type',
partlabel : 'primary',
partuuid  : 'xxx'

###

exec = require('child_process').exec

blkids = (cb) ->
  return if require('os').platform() isnt 'linux' then cb []

  exec 'blkid -g && blkid', (e, stdout, stderr) ->
    out = stdout.split('\n').slice(0, -1).map (line) ->
      regex = new RegExp(/(\w+)\=\"([^\"]+)/g)
      part  = partition:line.match(/^(\S+)\:\ /)[1]
      part[result[1].toLowerCase()] = result[2] while result = regex.exec line
      part
    .sort (a,b) -> a.partition.localeCompare b.partition
    cb out

module.exports.all = (cb) -> blkids cb

module.exports.partitions = (partitions, cb) ->
  blkids (parts) ->
    out = []
    for part in parts
      out.push part if -1 < partitions.indexOf part.partition
    cb out

module.exports.devices = (cb) ->
  blkids (parts) ->
    out = {}

    for part in parts
      out[part.partition.split('/').pop().match(/^([a-z]+)/)[0]] = 1

    cb Object.keys(out).sort()
