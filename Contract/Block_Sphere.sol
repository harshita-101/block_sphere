// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Project {
    string public projectName;
    address public owner;
    
    // Simple mapping to store user data
    mapping(address => uint256) public userValue;

    constructor(string memory _projectName) {
        projectName = _projectName;
        owner = msg.sender;
    }

    // Store a numeric value for the sender
    function storeValue(uint256 _value) external {
        userValue[msg.sender] = _value;
    }

    // Retrieve a user's stored value
    function retrieveValue(address _user) external view returns (uint256) {
        return userValue[_user];
    }

    // Update project name (owner-only)
    function updateProjectName(string memory _name) external {
        require(msg.sender == owner, "Only owner can update the project name");
        projectName = _name;
    }
}

