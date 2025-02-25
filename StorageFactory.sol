// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// import "./SimpleStorage.sol";
import {SimpleStorage}  from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorage;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStorage.push(newSimpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256  _newSimpleStorageNumber) public {
        // SimpleStorage mySimpleStorage = SimpleStorage(listOfSimpleStorage[_simpleStorageIndex]);
        // mySimpleStorage.store(_newSimpleStorageNumber);

        listOfSimpleStorage[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        // SimpleStorage mySimpleStorage = SimpleStorage(listOfSimpleStorage[_simpleStorageIndex]);
        // return mySimpleStorage.retrieve();

        return listOfSimpleStorage[_simpleStorageIndex].retrieve();      
    }
}