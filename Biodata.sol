// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Biodata {
    uint public data;

    struct Schema_Item {
        uint256 _id;
        string _Surname;
        string _Middlename;
        string _Lastname;
        string _Email;
    }

    Schema_Item public biodata;

    constructor(string memory _id, string memory _Surname, string memory _Middlename, string memory _Lastname, string memory _Email) {
        biodata._id = _id;
        biodata._Surname = _Surname;
        biodata._Middlename = _Middlename;
        biodata._Lastname = _Lastname;
        biodata._Email = _Email;
    }

    function MyData() public view returns (Schema_Item memory) {
        return biodata;
    }
}




                
