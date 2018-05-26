class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
  
  def valid?
    sender.valid? && receiver.valid?
  end 
  
  
  def execute_transaction
    if valid? && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end 
  end 
  
  
  def reverse_transfer
    if @status = "complete"
      sender.balance += amount
      receiver.balance -= amount 
      @status = "reversed"
    else 
      "There is no transaction to reverse."
    end 
  end 
  
end
