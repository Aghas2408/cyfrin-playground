// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// pragma solidity >=0.8.0 <0.9.0; range
// pragma solidity 0.8.17; fixed version of pragma

contract SimpleStorage {
    bool hasFavoriteNumber = false;
    uint256 public favoriteNumber = 88;    //uint default internal
    int256 favoriteNumberInt = -88;
    string favoriteNumberInText = "88";
    address myAddress = 0x751bc4030AdE96eAa901f3528eDED650a7EaFa4E;
    bytes32 favoriteBytes32 = "cat";

    uint defaultValue;

    uint256[] listOfFavoriteNumbers; // [0, 78, 90]
    
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Person public me = Person(10, "test");
    // Person public you = Person({
    //     favoriteNumber: 11,
    //     name: "super"
    // });

    //dynamic array
    Person[] public listOfPeople;

    //static array
    Person[3] public listOfPeople2;


    //mapping
    mapping(string => uint256) public nameToFavoriteNumber;


    function store(uint _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        favoriteNumber = favoriteNumber + 1;
        uint256 testVar = 5;
    }

    function somtething() public  {
        // testVar = 6; // returns error isn't visible here
    }

    // view pure
    function retrieve () public view returns (uint256) {
        return  favoriteNumber;
    }

        
    function retrieve2 () public pure returns (uint256) {
        return  1000;
    }
    // 0xd9145CCE52D386f254917e481eB44e9943F39138

    function addPersion(uint _favoriteNumber, string calldata _name) public  {  // memeory _name
        _favoriteNumber = 100;
        // calldata cannot be changed during function execution
        // _name = "test"; // return error
        // Person memory newPersion = Person(_favoriteNumber, _name);
        listOfPeople.push(Person(_favoriteNumber, _name));

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}