const web3 = require("web3");

const JokeToken = artifacts.require("JokeToken");

module.exports = async function (deployer) {

  const totalSupply = web3.utils.toBN("1000000000000000000000000000"); // 1 B tokens

  await deployer.deploy(JokeToken, "A simple JOKE", "JOKE", totalSupply);

  const token = await JokeToken.deployed();
  await token.mint("0x6ef91a90C46201da680430B49583Bf3b47FfAc26", web3.utils.toBN("500000000000000000000000"))
};
