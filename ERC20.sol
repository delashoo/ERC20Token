//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import '@openzeppelin/contracts/token/ERC20/SafeERC20.sol';

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Mintable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";



contract MyToken is SafeERC20,  ERC20, ERC20Detailed, ERC20Burnable, ERC20Mintable, ERC20Capped {
   
    address public admin;

    constructor() ERC20Detailed("Josa", "JOS", 18) ERC20Capped(144000000) 
    {
        _mint(msg.sender, 144000000 * 10 ** 18);
    }

    function burn(uint256 amount) external returns () 
    {
        _burn(msg.sender, amount);
    }

    function mint(address to, uint256 amount ) external returns () 
    {
        require(msg.sender == admin, 'Only admin');
        _mint(to, amount);   
    }
}
