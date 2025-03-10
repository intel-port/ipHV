    contract ipHV is ReentrancyGuard {

    // IPCS Service
        address private IPCSService = 0x00081058476a5fcBf8E5f723367D06dF2D5C74ab; // EOA - Contract address are not allowed!

    // IPHV Contract Version
        string public Version = "v8.3.2";

    modifier onlyVerified() {
        require(isVerified[msg.sender], "You must verify first!");
        _;
        }

    modifier onlyIPCSService() {
        require(msg.sender == IPCSService, "Only IPCSS can call this function");
    _   ;
        }
    
    modifier whenUnlocked() {
        require(block.timestamp >= unlockTimes[msg.sender], "Your ETH are still locked!");
        _;
        }

    constructor() {
        // No owner, fully autonomous contract. <3
        }

    receive() external payable {
        require(msg.sender.code.length == 0, "Smart contracts cannot send ETH to this ipHV contract");
        etherBalances[msg.sender] += msg.value;

        emit EtherReceived(msg.sender, msg.value);
        }
