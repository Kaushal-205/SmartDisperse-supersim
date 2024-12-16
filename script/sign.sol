// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console2} from "forge-std/Script.sol";

contract ErrorSignaturesScript is Script {
    function run() pure public {
        // Log error signatures
        logErrorSignature("NotEntered()");
        logErrorSignature("IdOriginNotL2ToL2CrossDomainMessenger()");
        logErrorSignature("EventPayloadNotSentMessage()");
        logErrorSignature("MessageDestinationSameChain()");
        logErrorSignature("MessageDestinationNotRelayChain()");
        logErrorSignature("MessageTargetCrossL2Inbox()");
        logErrorSignature("MessageTargetL2ToL2CrossDomainMessenger()");
        logErrorSignature("MessageAlreadyRelayed()");
        logErrorSignature("ReentrantCall()");
        logErrorSignature("TargetCallFailed()");
    }

    function logErrorSignature(string memory errorSignature) internal pure {
        bytes32 errorHash = keccak256(abi.encodePacked(errorSignature));
        bytes4 errorSelector = bytes4(errorHash);
        
        console2.log("Error: %s", errorSignature);
        console2.log("Selector:");
        console2.logBytes4(errorSelector);
        console2.log("---");
    }
}