pragma solidity ^0.4.21;

contract CallMeChallenge {
    bool public isComplete = false;

    function callme() public {
        isComplete = true;
    }
}

//https://ropsten.etherscan.io/address/0xadc2dc7c7b8a7f3cba509cceeafe1c975df0ed8f#code