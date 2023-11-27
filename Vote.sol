// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vote {
    struct Candidate {
        string name;
        uint voteCount;  
    }

    Candidate[] public candidates;  

    uint public voteCount;  
    mapping(address => bool) public hasVoted;

    event Voted(address indexed voter, uint indexed candidateIndex);

    modifier notVoted() {
        require(!hasVoted[msg.sender], "You have already voted.");
        _;
    }

    function addCandidate(string memory _name) public {
        candidates.push(Candidate(_name, 0));
    }

    function vote(uint _candidateIndex) public notVoted {
        require(_candidateIndex < candidates.length, "Invalid candidate index");

        
        candidates[_candidateIndex].voteCount++;

        
        hasVoted[msg.sender] = true;

        
        emit Voted(msg.sender, _candidateIndex);
    }

    function getVoteCount(uint _candidateIndex) public view returns (uint) {
        require(_candidateIndex < candidates.length, "Invalid candidate index");
        return candidates[_candidateIndex].voteCount;
    }

    function getCount() external view returns (uint) {
        return voteCount;  
    }
  

}


