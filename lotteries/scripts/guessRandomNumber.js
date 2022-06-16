const Web3 = require("web3");
// add your infura URL here
const ethNetwork =
  "https://ropsten.infura.io/v3/";
const web3 = new Web3(new Web3.providers.HttpProvider(ethNetwork));


// address of deployed contract
var contractAddress = '0x9B7E82Ae964aD535Ee256e236A4cAA95dD26Fc8F';
// get storage at slot 0
var storageAt0;
web3.eth.getStorageAt(contractAddress, 0, (err, res) => { 
  // convert to uint
  console.log(`0: uint8: ${web3.utils.toDecimal(res)}`);
});

//0: uint8: 176
