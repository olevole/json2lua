# json2lua
parse json in lua (via cjson) and print values by item

# Installing

  FreeBSD:
  ~~~
  pkg install lua51 lua51-cjson
  ~~~
  
# Usage:
  ~~~
  % json2lua <filename>
  % json2lua <filename> item
  % json2lua <filename> depth1.depth2.item
   
  % cat json.json | json2lua item
  % cat json.json | json2lua depth1.depth2.item
  ~~~
