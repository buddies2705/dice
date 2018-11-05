var Dice = artifacts.require("./Dice.sol");

module.exports = function(deployer) {
  deployer.deploy(Dice);
};
