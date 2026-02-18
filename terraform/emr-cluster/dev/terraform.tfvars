# Cluster Configuration (change these frequently)
cluster_name = "dev-emr-cluster"
emr_version  = "emr-6.8.0"
applications = [
  "Spark",
  "Hadoop",
  "Hive",
  "Hbase",
  #"JupyterEnterpriseGateway",
  # "AmazonCloudWatchAgent",  # Available 7.X+
  # "Flink",
  # "Hue",
  # "Livy",
  # "Oozie",
  # "Phoenix",
  # "Pig",
  # "Presto",
  # "Sqoop",  # Removed 7.4+
   "Tez",
  # "Zeppelin",
  # "ZooKeeper",
   "Ganglia",  # Removed 7.X
  # "MXNet",  # Removed 7.3+
  # "TensorFlow",
]

# Instance Configuration
master_instance_type = "m5.xlarge"
core_instance_type   = "m5.xlarge"
core_instance_count  = 2
task_instance_type   = "r5.2xlarge"
task_instance_count  = 0

# Bootstrap Action
bootstrap_script_name = ""  
bootstrap_action_name = ""
bootstrap_action_args = []

configurations_json = ""


termination_protection            = false  
keep_job_flow_alive_when_no_steps = true   
auto_termination_timeout          = 21600  
unhealthy_node_replacement        = true   
