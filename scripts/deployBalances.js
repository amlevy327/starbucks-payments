
const hre = require('hardhat');

async function main() {

  const Balances = await hre.ethers.getContractFactory(
    'Balances',
  );

  const name = "Balances"
  const symbol = "B"

  // TODO: update
  const paymentToken = "0x9C87330d50673C8C15dbfe18b093872631a5EdcA"

  const balances = await Balances.deploy(
    name,
    symbol,
    paymentToken
  );

  await balances.waitForDeployment();

  console.log(`balances deployed to ${await balances.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});