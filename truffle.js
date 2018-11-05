var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "answer juice anxiety dawn buddy fan slot remain illness bulb beauty away";


module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/c3ac157a6af942788da7f2aef4662945")
      },
      network_id: 4
    }   
    }
};
