// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {
    uint256   MAX_TWEET_LENGTH = 250;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function changeTweetLength(uint256 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function addLikeToTweet(uint256 id) external {
        require(tweets[msg.sender][id].likes > 0, "The tweet has no likes");
        require(tweets[msg.sender][id].id == id, "The tweet is not stated");
        tweets[msg.sender][id].likes++;
    }

    function unlikeTweet(uint256 id) external {
        require(tweets[msg.sender][id].id == id, "The tweet is not stated");
        tweets[msg.sender][id].likes--;
    }

    function createTweet(string memory _content) public {
        require(bytes(_content).length <= MAX_TWEET_LENGTH, "Tweet length exceeds the maximum allowed length");
        tweets[msg.sender].push(Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _content,
            timestamp: block.timestamp,
            likes: 0
        }));
    }

    function getTweet(address _owner, uint256 _id) public view returns (Tweet memory) {
        return tweets[_owner][_id];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}



     
