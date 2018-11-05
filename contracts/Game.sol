pragma solidity ^0.4.24;

contract Game{

	uint8 public currentBet;

	bool public isBetSet;

	uint8 private destiny;

	uint8 public randomFactor;

	event NewBetIsSet(uint8 currentBet);

	event GameResult(address bidder, uint8 currentBet , uint8 destiny);

	constructor() public{
		isBetSet = false;
		randomFactor = 10;
	}

	function getNewbet() public returns(uint8){
		isBetSet = true;
		currentBet = random();
		randomFactor += currentBet;
		emit NewBetIsSet(currentBet);
		return currentBet;
	}

	function roll() public returns(address , uint8 , uint8){
		require(isBetSet == true);
		destiny = random();
		randomFactor += destiny;
		isBetSet = false;
		if(destiny == currentBet){
			msg.sender.transfer(100000000000000);
			emit GameResult(msg.sender, currentBet, destiny);			
		}else{
			emit GameResult(msg.sender, currentBet, destiny);
		}
		return (msg.sender , currentBet , destiny);
	}


    function random() private view returns (uint8) {
       	uint256 blockValue = uint256(blockhash(block.number-1 + block.timestamp));
        blockValue = blockValue + uint256(randomFactor);
        return uint8(blockValue % 5) + 1;
    }

    function() public payable{}
	

}