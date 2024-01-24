require_relative 'lib/hashmap'

hashMap = HashMap.new(1)
hashMap.set('what', 'the freak??')
hashMap['dude'] = 'brother'
hashMap['OMG'] = 'OH MY GOD'
hashMap['poop'] = 'deck'
p hashMap.get('what')
p hashMap.keys
p hashMap.values
p hashMap.entries
