// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }
}