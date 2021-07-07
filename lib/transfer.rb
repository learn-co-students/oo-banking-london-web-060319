class Transfer
  # your code here
attr_writer
attr_accessor :status
attr_reader :sender, :receiver, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    if @status == "pending" && self.valid?
      @sender.balance -= @amount 
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected" 
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" 
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
end