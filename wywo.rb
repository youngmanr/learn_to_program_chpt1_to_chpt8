=begin
Author: R Youngman
Date: 28/08/15

While You Were Out message taking application
=end

class Message
  attr_accessor :id, :to, :from, :at, :phone, :action, :body
  @@uniqueId = 0

  def initialize (messageList, to, from, at, phone, action, body)
    @id = newMsgId()
    @to = to
    @from = from
    @at = at
    @phone = phone
    @action = action
    @body = body
    messageList[messageList.length] = self
  end

  private
  def newMsgId()
    @@uniqueId += 1
    return @@uniqueId
  end

  public
  def displayMessage()
    puts "Id: " + @id.to_s
    puts "To: " + @to.to_s
    puts "From: " + @from.to_s
    puts "At: " + @at.to_s
    puts "Phone: " + @phone.to_s
    puts "Action: " + @action.to_s
    puts "Message: " + @body.to_s
  end

end

def addMessage( messageList, to, from, at, phone, action, body)
  message = Message.new( messageList, to, from, at, phone, action, body)
end

def deleteMessage( messageList, id)
  messageList.each  {|message|
    if (message.id == id)
      messageList.delete(message)
    end
  }
end

def countMessages( messageList)
  return messageList.length
end

def listMessages( messageList)
  messageList.each {|message|
    puts message.displayMessage()
  }
end

def listMessagesTo( messageList, name)
  # list all messages addressed soome-one specific
  messageList.each {|message|
    if(message.to == name)
      puts message.displayMessage()
    end
  }
end

def listMessagesFrom( messageList, name)
  # list all messages addressed soome-one specific
  messageList.each {|message|
    if(message.from == name)
      puts message.displayMessage()
    end
  }
end

def messagesAfter( messageList, after)
  messageList.each { |message|
    if (message.at > after)
      puts message.displayMessage()
    end
  }
end

def listMessagesWithAction( messageList, action)
  messageList.each { |message|
    if (message.action == action)
      puts message.displayMessage()
    end
  }
end

command = " "
:willCallAgain
:urgent
:pleaseCall
:returnedCall
:leftMessage

messageList = []

addMessage( messageList, "Robert", "Jeanette", Time.new(2015,8,28), "0117", :willCallAgain, "Don't forget the taps")
addMessage( messageList, "Robert", "Jeanette", Time.new(2015,8,27), "0117", :urgent, "Buy some beer")
addMessage( messageList, "Jeanette", "Robert", Time.new(2015,8,26), "994300", :pleaseCall, "I've bought beer")
addMessage( messageList, "Jeanette", "Robert", Time.new(2015,8,25), "0117", :returnedCall, "Buy some crisps")

puts "number of messages is " + countMessages(messageList).to_s
listMessages( messageList)

puts "delete message 2"
deleteMessage( messageList, 2)

puts "number of messages is " + countMessages(messageList).to_s
listMessages( messageList)

puts "List message to Jeanette"
listMessagesTo( messageList, "Jeanette")

puts "List message from Jeanette"
listMessagesFrom( messageList, "Jeanette")

puts "List messages after August 26"
messagesAfter( messageList, Time.new(2015,8,26))

puts "List returned call  messages"
listMessagesWithAction( messageList, :returnedCall)

until command == "exit"
  puts "Type one of the following commands or <CR> to exit "
  puts "<add> to add a message"
  puts "<delete> to delete a message"
  puts "<to> to list messages to a specific person"
  puts "<from> from to list messages from a specific person"
  puts "<after> to list all messages after a specific time"
  puts "<action> to list all messages with a specific action"
  puts "<count> to list how many messages"
  puts "<list> to list all messages"
  puts "<exit> to exit"

  command = gets.chomp.downcase

  case command
    when "add"
      puts "To? "
      to = gets.chomp.capitalize
      puts "From? "
      from = gets.chomp.capitalize
      at = Time.now
      puts "Phone? "
      phone = gets.chomp.capitalize
      puts "Enter action"
      puts "<0> for Will Call Again"
      puts "<1> for Urgent"
      puts "<2> for Please Call"
      puts "<3> for Returned Call"
      puts "<4> for Left Message"
      action = gets.chomp.to_i
      puts "Message? "
      body = gets.chomp
      addMessage( messageList, to, from, at, phone, action, body)
    when "delete"
      puts "Enter message Id? "
      id = gets.chomp.to_i
      deleteMessage(messageList, id)
    when "to"
      puts "Enter name? "
      to = gets.chomp.capitalize
      listMessagesTo(messageList, to)
    when "from"
      puts "Enter name? "
      from = gets.chomp.capitalize
      listMessagesFrom(messageList, from)
    when "list"
      listMessages(messageList)
    when "count"
      puts "Number of messages is " + countMessages(messageList).to_s
    when "exit"
      puts "Bye Bye"
    else
      puts "unknown command!"
  end
end
