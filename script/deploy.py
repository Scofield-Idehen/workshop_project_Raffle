from moccasin.config import get_active_network
from src import workshop
from moccasin.boa_tools import VyperContract


# Deploy the contract
def deploy() -> VyperContract:
  network = get_active_network()

  deployer = workshop.deploy()
  print(f"see the deployer address {deployer.address}")
  return deployer.address

# Main entry point
def moccasin_main() -> VyperContract:
    return deploy()
