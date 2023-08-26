// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Define the enum outside the contract
enum Status {
    Email,
    Username,
    PhoneNumber
}

contract Login {
    Status public currentStatus; // Store the current status
    
    struct ItemsSchema {
        uint256 _email;
        uint256 _username;
        uint256 _phoneNumber;
    }

    // Constructor to initialize the contract
    constructor() {
        currentStatus = Status.Email; // Set initial status to Email
    }

    // Function to increment the status
    function incrementStatus() public view returns (Status) {
        if (currentStatus == Status.Email) {
            return Status.Username;
        } else if (currentStatus == Status.Username) {
            return Status.PhoneNumber;
        } else {
            return Status.Email;
        }
    }
}
