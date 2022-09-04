// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Funder {
    uint public numofFunders;

    // create map from int to address
    mapping(uint=>address) private funders;

    receive() external payable{
        
    }

    function transfer() external payable{
        //storing the address of that funder
        funders[numofFunders]=msg.sender;
    }

    function withdraw(uint withdrawAmount) external{
        //ether to wei
        //max 2 ether
        require(withdrawAmount <= 2000000000000000000,"Cannot withdraw more than 2 Ether");
        //transfer the amount
        payable(msg.sender).transfer(withdrawAmount);
    }

}