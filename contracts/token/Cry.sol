pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Cry is ERC20{

    address public admin;
    event AdminChange(address indexed Admin, address indexed newAdmin);
    constructor(address manager) public ERC20("Cry", "Cry") {
        admin = manager;
        _mint(manager, 10_000_000_000 *10 ** 18);
    }
    
    modifier  _isOwner() {
        require(msg.sender == admin);
        _;
    }
    
    function changeOwner(address manager) external _isOwner {
        admin = manager;
        emit AdminChange(msg.sender,manager);
    }
    
    function burn(address account, uint256 amount) external _isOwner{
        _burn(account, amount);
    }
}
