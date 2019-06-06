class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(status="pending", sender, receiver, amount)
    @status = status
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @sender.balance > @amount && self.status == 'pending'
      @sender.balance -= @amount 
      @receiver.balance += @amount
      self.status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      @sender.balance += @amount 
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end

end
