function setTL(uint256 durationAsSec) external onlyVerified {
    require(unlockTimes[msg.sender] == 0 || block.timestamp >= unlockTimes[msg.sender], "Time lock already set, wait until unlocked");
    require(durationAsSec > 0 && durationAsSec <= 220752000, "Invalid duration (max 7 years!)");
    require(block.timestamp + durationAsSec > block.timestamp, "Invalid timestamp");
        
    unlockTimes[msg.sender] = block.timestamp + durationAsSec;
    emit TimeLockSet(msg.sender, unlockTimes[msg.sender]);
    }
