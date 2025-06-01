venv_name=.venv
init_exp_name=template_exp

python3 -m venv "$venv_name"
source "$venv_name/bin/activate"

cd devops 
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements_installer.txt
uv sync

pre-commit install

nohup bash ./tasks/mlflow_server.sh &> logs/server_logs.log &

python3 -m tasks.experiment_creation --exp_name "$init_exp_name"
