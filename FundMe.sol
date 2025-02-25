// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract FundMe {
    uint256 public mimimumUsd = 5;

    function fund() public payable {
        require(msg.value > mimimumUsd, "Didn't sent enough eth");
        // Failed tx consumes gas, remaiming returned to user

    }

    function withdraw() public {

    }
}