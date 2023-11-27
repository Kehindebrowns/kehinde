// SPDX-License-Identifier: MIT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Adding {
    uint public add;

    function incrementValue() public {
        add += 1;
    }

    function addValue(uint x,
     uint y) public view returns (uint) {
        return x + y;
    }
}
