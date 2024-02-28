pragma solidity ^0.5.0;

// Define a new contract named 'JointSavings'
contract JointSavings {
    /*
     Define the following variables in the newly created contract
     1. Two variables of type 'address payable' named 'accountOne' and 'accountTwo'
     2. A variable of type 'address public' named 'lastToWithdraw'
     3. Two variables of type 'uint public' named 'lastWithdrawAmount' and 'contractBalance'
     */
     address payable accountOne;
     address payable accountTwo;
     address public lastToWithdraw;
     uint public lastWithdrawAmount;
     uint public contractBalance;

     /*
     Define a function named 'withdraw' that accepts two variables:
     - uint variable named 'amount'
     - payable address named 'receipient'
     */

     function withdraw(uint amount, address payable recipient) public {
        /*
        Define a `require` statement that checks if the `recipient` is equal to either 
        `accountOne` or `accountTwo`. The `require` statement returns the 
        text `"This is not your account!"` if it does not.
        */

        require(recipient == accountOne || recipient == accountTwo, "This is not your account");

        /*
         /*
        Define a `require` statement that checks if the `balance` is sufficient to 
        accomplish the withdraw operation. If there are insufficient funds, the text 
        `Insufficient funds!` is returned.
        */

        require(amount <= contractBalance, "Insufficient funds!");

        /*
        Add and `if` statement to check if the `lastToWithdraw` is not equal to (`!=`) 
        to `recipient` If `lastToWithdraw` is not equal, then set it to the current value of `recipient`.
        */

        if (lastToWithdraw != recipient){
            lastToWithdraw = recipient;
        }

        /*
        Call the `transfer` function of the `recipient` and pass it the `amount` to transfer as 
        an argument.
        */

        recipient.transfer(amount);

        /*
        Set  `lastWithdrawAmount` equal to `amount`
        */

        lastWithdrawAmount = amount;
     }

     /*
     Define a `public payable` function named `deposit`
     */

     function deposit() public payable {

        /*
        Call the `contractBalance` variable and set it equal to the balance of the contract
        by using `address(this).balance`
        */
        contractBalance = address(this).balance;
     }

     /*
     Define a `public` function named `setAccounts` that receive two `address payable`
     arguments named `account1` and `account2`
     */

     function setAccounts(address payable account1, address payable account2) public{
        /*
        Set values of `accountOne` and `accountTwo` to `account1` and `account2`
        */

        accountOne = account1;
        accountTwo = account2;
     }

     /*
     Finally, add the **default fallback function** so that your contract can store Ether sent from 
     outside the deposit function.
     */

     function () external payable {}
}
