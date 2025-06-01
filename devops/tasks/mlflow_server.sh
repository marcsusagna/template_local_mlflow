MLFLOW_HOST_IP=127.0.0.1
MLFLOW_PORT=8080
BACKEND_STORE=file:../mlruns 

mlflow server --host $MLFLOW_HOST_IP --port $MLFLOW_PORT --backend-store-uri $BACKEND_STORE --default-artifact-root $BACKEND_STORE
# Command to find process to shutdown: 
# lsof -i ":$MLFLOW_PORT"

# Create .env file to be picked up by client applications (i.e. notebooks / libraries with models)
cat <<EOF > .env
MLFLOW_TRACKING_URI=http://${MLFLOW_HOST_IP}:${MLFLOW_PORT}
EOF