const MyToken = artifacts.require("MyToken")

module.exports = async function (deployer, networks, acoounts) {
    await deployer.deploy(MyToken)
    const myToken = await MyToken.deployed()
}