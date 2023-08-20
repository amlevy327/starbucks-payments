const hre = require('hardhat');

async function main() {

  const USDC = await hre.ethers.getContractFactory(
    'USDC',
  );

  const name = "USDC"
  const symbol = "USDC"

  const usdc = await USDC.deploy(
    name,
    symbol
  );

  await usdc.waitForDeployment();

  console.log(`usdc deployed to ${await usdc.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});