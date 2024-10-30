// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

contract simpleStorage{
    //Storing the state variable in a storage location
    uint256 public favouriteNumber; //To store the favourite Number
    uint256[] public favouriteNumbers; //A dynamic array to store multiple favourite Numbers

    //Struct to store a persons name and favouriteNumber
    struct Person{
        string name; //Person's name
        uint256 favouriteNumber; //Person's favourite Number
    }

    Person[] public people; //Array of Person struct to store multiple people data

    //enum to manage contract state (Active or Inactive)
    enum contractState{
        Active, //State representing an active contract state
        Inactive //State representing an inactive contract state
    } 

    contractState public state; //State variable to store the current contract state

     //PART 3 / MC WEEK 3
     //Implementing Events and emits
     event numberUpdated(uint256 newNumber);
    //PART 3
    function storeNumber(uint256 _favouriteNumber) public{
        favouriteNumber = _favouriteNumber;
        emit numberUpdated(_favouriteNumber);
    }

    function getFavouriteNumber() public view returns(uint256){
        return favouriteNumber;
    }

    function isGreaterThan(uint256 _value) public view returns(bool){
        require(favouriteNumber>_value, "It is not True");
        return true;
    }

    function sumToFavouriteNumber() public view returns(uint256){
        uint256 sum = 0;
        for (uint256 count=0; count<=favouriteNumber; count++)
        {
            sum = sum + count;
        }        return sum;
    }


    //PART 4
    //Using Public Visibility
    uint256 public secretNumber;
    function setSecretNumber(uint256 _secretNumber) public{
        secretNumber = _secretNumber;
    }

    function getSecretNumber() public view returns(uint256){
        return secretNumber;
    }

    //Using Internal Visibility
    function internalData() internal pure returns(string memory){
        return "This is internal Data";
    }

    //Using External Visibility
    function externalFunction() external pure returns(string memory){
        return "This is an external data";
    }

    function testExternalFunction() public view returns(string memory){
        return this.externalFunction();
    }

    //Implementing Dynamic Arrays
    function addFavouriteNumber(uint256 _number) public{
        favouriteNumbers.push(_number);
    } 
     // This function was created to test the Dynamic Array above
    // function getFavouriteNumbers() public view returns(uint256[] memory){
    //     return favouriteNumbers;
    // }

    //Implementing mapping PART 2 / MC WEEK 3
    mapping(string=>uint256) public nameToFavouriteNumber;

    function addPerson(string memory _name, uint256 _favouriteNumber) public{
        people.push(Person(_name, _favouriteNumber));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    // //This function is to test the Struct Person
    // function getPerson() public view returns(Person[] memory){
    //     return people;
    // }


    //The use of enums
    function activateContract() public{
        state=contractState.Active;
    }
    function deactivateContract() public{
        state=contractState.Inactive;
    }
    function isActive() public view returns(bool){
        return state == contractState.Active;
    }

    //Implementing a memory storage location
    function whatName(string memory _name) public pure returns(string memory){
        string memory name = _name;
        return name;
    }

    //Implementing calldata storage location
     function concatenateString(string calldata _inputString) public pure returns (string memory) {
        // Memory variable to store the concatenated result
        string memory newString = string(abi.encodePacked(_inputString, " is awesome!"));
        return newString;
    }



}