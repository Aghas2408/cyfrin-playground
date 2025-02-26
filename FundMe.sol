// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    address immutable owner;

    constructor () {
        owner = msg.sender;
    }

    function fund() public payable {
        
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't sent enough eth");
        // Failed tx consumes gas, remaiming returned to user
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        require(msg.sender == owner, "Must be an owner");
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) 
        {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        //trasnfer
        // payable(msg.sender).transfer(addressToAmountFunded[msg.sender]);

        //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner() {
        // require(msg.sender == owner, "Must be an owner");
        if(msg.sender != owner){
            revert NotOwner(); 
        }
        _;
    }

    // function getVersion() public view returns (uint256) {
    //     return  AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    // }


    receive() external payable {
        fund();
    }
    
    fallback() external payable {
        fund();
    }

}