const MyToken = artifacts.require("MyToken")
const FarmToken = artifacts.require("FarmToken")

module.exports = async function (deployer, networks, acoounts) {
    // deploy MyToken
    await deployer.deploy(MyToken)
    const myToken = await MyToken.deployed()

    // deploy FarmToken
    await deployer.deploy(FarmToken, myToken.address)
    const farmToken = await FarmToken.deployed()
}