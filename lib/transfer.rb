require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
  
  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount 
  end 
  
  
  def execute_transaction
    if valid? && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
      #binding.pry if amount == 4000
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      #binding.pry if amount == 4000
    end 
  end 
  
  
  def reverse_transfer
    if @status != "reversed"
      sender.balance += amount
      receiver.balance -= amount 
      @status = "reversed"
    end
  end 
  
end
