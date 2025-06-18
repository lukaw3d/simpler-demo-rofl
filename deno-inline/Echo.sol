// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Echo {
    event Message(string message);
    function emitMessage(string memory message) public {
        emit Message(message);
    }
}
