# simple sanity test for BrowserPlus server.

require 'websocket.rb'
 
class BPProxy
  def complete(val)
    puts "COMPLETE: #{val}"
  end
  
  def error(error, verbose)
    puts "ERROR: #{error}: #{verbose}"
  end
end
 
class Callback
  def invoke(val)
    puts "CALLBACK: #{val}"
  end
end
 
bp = BPProxy.new
socket = WebSocket.new([])
callback = Callback.new
puts "TEST Socket"
socket.connect(bp, {'recv'=>callback, 'host'=>"localhost", 'port'=>2626})
sleep 20
puts "TEST STOP"

sleep 1