 // SPDX-lisence-Identifier: MIT
 pragma solidity ^0.8.0;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  constructor() public {
    owner = msg.sender;
  }

  modifier restricted() {
    if (msg.sender == owner)
   _;
  }
 function getCompleted(address last_completed_migration) public {
    require(setCompleted());
}

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
   
}
