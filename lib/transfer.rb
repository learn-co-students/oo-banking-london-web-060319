require 'pry'


class Transfer
 # your code here
 attr_accessor :amount
 attr_reader :status, :sender, :receiver

 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @status = 'pending'
   @amount = amount
 end

 def valid?
   @sender.valid? && @receiver.valid?
 end

def execute_transaction
   if valid? && @status == "pending" && @sender.balance > @amount
    receiver.balance += @amount
    sender.balance -= @amount
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
  receiver.balance -= @amount
  sender.balance += @amount
  @status = "reversed"
end 
end

 #def valid?(sender)
 #  if @balance > 0 && @status == 'open'
 #    true
 #  elsif false
 #  end


end
