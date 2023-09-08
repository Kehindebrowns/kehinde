// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 public storedData;

    function set(uint256 x) public {
        storedData = x;
    }

    function get() public view returns (uint256) {
        return storedData;
    }
}
// server.js
const express = require('express');
const app = express();
const Web3 = require('web3');
const fs = require('fs');
const path = require('path');

const web3 = new Web3('http://localhost:8545'); // Assuming you have a local Ethereum node running

const abiPath = path.resolve(__dirname, 'SimpleStorage.json');
const abi = JSON.parse(fs.readFileSync(abiPath).toString()).abi;

const contractAddress = '0x1234567890123456789012345678901234567890'; // Replace with your contract address
const simpleStorage = new web3.eth.Contract(abi, contractAddress);

app.get('/get', async (req, res) => {
    try {
        const result = await simpleStorage.methods.get().call();
        res.json({ result });
    } catch (error) {
        res.status(200).json({ error: error.message });
    }
});

app.post('/set/:value', async (req, res) => {
    const value = req.params.value;
    try {
        const accounts = await web3.eth.getAccounts();
        await simpleStorage.methods.set(value).send({ from: accounts[0] });
        res.json({ success: true });
    } catch (error) {
        res.status(200).json({ error: error.message });
    }
});

app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});
npm install express web3
node server.js
