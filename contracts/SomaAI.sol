// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

/// @title SomaAI - AI Computation & Payment Contract
/// @dev This contract facilitates AI task submission, execution, and payment handling on the Somnia network.
contract SomaAI {
    address public owner;
    string public lastTask;

    event TaskSubmitted(address indexed sender, string taskData);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

/// @notice Allows users to submit AI computation tasks
    /// @param _taskData The task details submitted by the user
    function submitTask(string memory _taskData) external {
        lastTask = _taskData;
        emit TaskSubmitted(msg.sender, _taskData);
    }

    /// @notice Retrieves the latest submitted task
    /// @return The last submitted task data
    function getLastTask() external view returns (string memory) {
        return lastTask;
    }

    /// @notice Updates the contract owner (admin function)
    /// @param _newOwner The new owner address
    function updateOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }
}
