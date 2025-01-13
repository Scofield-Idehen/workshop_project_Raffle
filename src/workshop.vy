# pragma version ^0.4.0




min_usd: public(uint256)   # set the price 
funders: public(DynArray[address, 1000]) #set the array of funder of the lottery 
owner : address


@deploy
def __init__():
    self.min_usd = as_wei_value(1, "ether")
    self.owner = msg.sender


@internal
@payable 
def enter_raffle():
    value_of_funder: uint256 = self.min_usd
    assert msg.value == value_of_funder
    self.funders.append(msg.sender)



def pick_winner():
    assert len(self.funders) > 0, "No funders available"

    random_index: uint256 = (block.timestamp + block.number) % len(self.funders)
    winner: address = self.funders[random_index]

    raw_call(winner, b"", value= self.balance)
    self.funders = []


@external
def request_winner():
    self.pick_winner()


@external
@payable
def fund():
    self.enter_raffle()




@external 
@payable
def __default__():
    self.enter_raffle() 





