# Simple example that shows Ruby TCP client that sends and
# receives data.  No command line args accepted, just connects
# to server on localhost:2626.

require "socket" 

class ChatClient 
  def initialize( host, port ) 
    @clientSocket = TCPSocket.new("", port ) 
    @count = 1
  end # initialize 

  def run 
    while answer = @clientSocket.gets
      puts "got #{answer}"
      @clientSocket.puts("RubyClient pinging #{@count}")
      @count += 1
    end 
  end #run 

end #client

myChatClient = ChatClient.new("localhost", 2626)
myChatClient.run