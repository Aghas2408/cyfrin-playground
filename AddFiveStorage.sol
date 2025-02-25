// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function sayHello() public pure returns(string memory) {
        return "hello";
    }

    function store(uint256 _num) public override  {
        myFavoriteNumber = _num + 5;
    }
}