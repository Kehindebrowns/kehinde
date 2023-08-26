// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Collection {
    mapping(uint => names) public nameMapping;
    
    struct names {
        string design;
        string fabric;
    }

    constructor() {
        nameMapping[1] = names("senegales", "cotton");
        nameMapping[2] = names("gucci clothes", "silk");
        nameMapping[3] = names("versace clothes", "velvet");
        nameMapping[4] = names("louis vuitton", "leather");
        nameMapping[5] = names("native suit", "wool");
    }
}
