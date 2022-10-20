pragma solidity ^0.6.0;
contract MyWallet {

    address payable private owner;

    constructor() public {
        owner = msg.sender;
    }

    receive() external payable {
    }

    function sendEther(address payable _to, uint _amount) public {
        require(msg.sender == owner, "Must own this wallet to send Ether from it");
        require(address(this).balance >= _amount, "Cannot send more than this wallet holds");
        _to.transfer(_amount);
    }
}