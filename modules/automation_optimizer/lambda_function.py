import os
import json
import logging
import azure.functions as func

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def main(req: func.HttpRequest) -> func.HttpResponse:
    logger.info(f"Received event: {json.dumps(req.get_json())}")

    # Perform cost optimization logic here
    return func.HttpResponse("Cost optimization executed successfully.", status_code=200)
