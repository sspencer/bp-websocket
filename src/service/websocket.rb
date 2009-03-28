require "socket"

class WebSocket
  def initialize(context)  
    @clientSocket = nil
  end  
  
  def connect(bp, args)  
    host = args['host']
    port = args['port']
    cb = args['recv']

    begin
      @clientSocket = TCPSocket.new(host, port)
      while data = @clientSocket.gets
        cb.invoke(data)
      end
      
      bp.complete("Connection Closed by host!")
    rescue
      bp.error("Connection Refused", "No server listening at #{host}:#{port}")
    end
  end  
end  
  
rubyCoreletDefinition = {  
  'class' => "WebSocket",  
  'name' => "WebSocket",  
  'major_version' => 0,  
  'minor_version' => 0,  
  'micro_version' => 2,  
  'documentation' => 'Persistent TCP Socket.',  
  'functions' =>  
  [  
    {  
      'name' => 'connect',  
      'documentation' => "Connect to a TCP Server.",
      'arguments' => [  
        {  
          'name' => 'host',
          'type' => 'string',  
          'documentation' => 'Host name of server.',  
          'required' => true  
        },
        {  
          'name' => 'port',
          'type' => 'integer',  
          'documentation' => 'Port number.',
          'required' => true  
        },
        {  
          'name' => 'recv',
          'type' => 'callback',  
          'documentation' => 'Your javascript function that calls called whenever data is recieved.',  
          'required' => true  
        }  
      ]  
    }    
  ]   
}