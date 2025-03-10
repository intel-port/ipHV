function wdETH() external onlyVerified whenUnlocked nonReentrant {
    uint256 amount = etherBalances[msg.sender];
    require(amount > 0, "No Ether to Withdraw");

    etherBalances[msg.sender] = 0; 

    uint256 ipcss = (amount * 2) / 100;
    uint256 amountAfterIpcss = amount - ipcss;

    (bool successIpcss, ) = IPCSService.call{value: ipcss}("");
    require(successIpcss, "IPCSS transfer failed");

    (bool successRecipient, ) = msg.sender.call{value: amountAfterIpcss}("");
    require(successRecipient, "Transfer failed");

    emit EtherWithdrawn(msg.sender, amount);
    }
