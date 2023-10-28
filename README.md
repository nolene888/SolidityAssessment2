# Project Title

Project: Error Handling

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has two functions, a mint function that increases the total supply, and a burn function that subtracts the total supply. If the total supply goes beyond 1000, it causes an error. Similarly, if the total supply goes below 100, it also causes an error. The contract also makes sure that the transactor is the contract caller, otherwise it will also cause an error. This program serves as a simple and straightforward introduction to Solidity programming, and can be used as a stepping stone for more complex projects in the future.

## Getting Started

### Executing Program

To run this execute and run this program, you can use Remix, an online Solidity IDE. To get started, you may go to visit the Remix link:  https://remix.ethereum.org/.

Once you're at the Remix website, open the file explorer and look for the 'Create a new file' icon. Or, you could simply look for the 'New File' button at the Home page. Name your file with a '.sol' extension (e.g. myToken.sol). To execute the program, you may copy and paste the following code:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. For this project, write a smart contract that implements the require(), assert() and revert() statements.
*/

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


To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile smartContractProjects.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ErrorHandling" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the TotalSupply button to see your current total supply. Click on 'mint' to increase your total supply, and click on 'burn' to decrease your total supply. You may also click on 'transactor' to cross-check whether or not you're using the correct account.

## Author(s)

The author of this file is Nolene Ignacio

## License
This project is licensed under the MIT License
