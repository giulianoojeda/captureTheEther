import Web3 from "web3";

//we're looking for a unit8 number
function guessSecretNumber(secretHash: String) {
  // traverse hash and find the secret number
  for (let i = 0; i < 256; i++) {
    var hash = Web3.utils.soliditySha3({ type: "uint8", value: i.toString() });

    if (hash === secretHash) {
      console.log("Number is: ", i);
    }
  }
}

//Number is:  170
guessSecretNumber('0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365');