// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

//For this project, write a smart contract that implements the require(), assert() and revert() statements.

contract ErrorHandling {
    uint public totalSupply = 500;
    address public transactor;

//set the transactor to be the current address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    constructor() {
        transactor = msg.sender;
    }

//mint: increases total supply but total supply may not go beyond 1000
    function mint(uint _value) public{
        //1. make sure the transactor is referring to the current address of the contract caller
        assert(msg.sender == transactor);

        //2. increasing supply by value input
        totalSupply += _value;

        //3. check if added value made total supply go beyond or equal 1000
        require(totalSupply <= 1000, "Total supply can not go beyond 1000.");
    }

//burn: decrease total supply but total supply may not be less than 100
    function burn(uint _value) public{
        //1. make sure the transactor is referring to the current address of the contract caller
        assert(msg.sender == transactor);

        //2. decrease total supply by value input
        totalSupply -= _value;

        //3. check if subtracted value made total supply go below 100
        if (totalSupply < 100){
            revert("Total supply can not go below 100.");
        }
    }

}
