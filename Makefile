all:
	pip install computenest-cli==1.1.25
	computenest-cli generate --file_path=config.yaml.j2  --output_path=config.yaml --parameter_path=templates/parameters.yaml
	computenest-cli generate --file_path=common/templates/docker-compose.yaml.j2  --output_path=templates/template.yaml --parameter_path=templates/parameters.yaml
test:
	pip install computenest-cli==1.1.25
	computenest-cli generate --file_path=config.yaml.j2  --output_path=config.yaml --parameters='{"DockerImageArtifactId":"artifact-xxx","DockerImageArtifactVersion":"draft","Parameters":[{"Name":"AdminPassword","NoEcho":true,"Type":"String","Label":"管理员密码","AssociationProperty":"ALIYUN::ECS::Instance::Password"}],"CommandTimeout":300,"PreStartCommand":"#!/bin/bash\necho $${AdminPassword}\n","InstanceTypes":["ecs.c6.large","ecs.c6.xlarge","ecs.c6.2xlarge"],"Ports":[8080],"Outputs":[{"Label":"Endpoint","Expression":"https://$${Address}:8080"}]}'
	computenest-cli generate --file_path=common/templates/docker-compose.yaml.j2  --output_path=templates/template.yaml --parameters='{"DockerImageArtifactId":"artifact-xxx","DockerImageArtifactVersion":"draft","Parameters":[{"Name":"AdminPassword","NoEcho":true,"Type":"String","Label":"管理员密码","AssociationProperty":"ALIYUN::ECS::Instance::Password"}],"CommandTimeout":300,"PreStartCommand":"#!/bin/bash\necho $${AdminPassword}\n","InstanceTypes":["ecs.c6.large","ecs.c6.xlarge","ecs.c6.2xlarge"],"Ports":[8080],"Outputs":[{"Label":"Endpoint","Expression":"https://$${Address}:8080"}]}'
