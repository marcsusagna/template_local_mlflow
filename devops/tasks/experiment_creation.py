import argparse
from pathlib import Path
import logging

import mlflow
from mlflow import MlflowClient

# Constants
TRACKING_URI = "http://127.0.0.1:8080"
VERSION = "v1"

# Logger
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)

def main():
    parser = argparse.ArgumentParser(description="Create an MLflow experiment")
    parser.add_argument("--exp_name", type=str, required=True, help="Name of the MLflow experiment")
    args = parser.parse_args()

    # Var resolution
    exp_tags={"version": VERSION}
    exp_name=args.exp_name

    # Set MLFlow
    mlflow.set_tracking_uri(uri=TRACKING_URI)
    client = MlflowClient()

    experiment_id = client.create_experiment(
        exp_name,
        tags=exp_tags,
    )
    logger.info(f"Created experiment '{exp_name}' with ID: {experiment_id}")

if __name__ == "__main__":
    main()
