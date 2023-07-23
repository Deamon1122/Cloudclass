#### Session Video:
    Part-1 : https://drive.google.com/file/d/18IprZwPbyg1EZWULOaMoBlI-FQMriMNg/view?usp=sharing
    Part-2 : https://drive.google.com/file/d/1uN0lbcW3Zrgj1JpXjPIbsGjb1hdqWYAp/view?usp=sharing
    Part-3 : https://drive.google.com/file/d/1AEn6DWfgvynak5lA2yoREbRic5BFjN1d/view?usp=sharing


# Continuous Integration

```
GitHub :
    Repository : https://github.com/kesavkummari/cb9amjava/tree/b69am

    Branch : b69am

Maven Lifecycles :
    https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html

```
#### Buildspec Files :


#### buildspec_src.yml : 

```
version: 0.2

phases:
  install:
    runtime-versions:
      java: corretto11
  pre_build:
    commands:
      - echo Nothing to do in the pre_build phase...
      - echo Code Scan
      - mvn verify sonar:sonar
  build:
    commands:
      - echo Build started on `date`
      - mvn install
  post_build:
    commands:
      - echo Build completed on `date`
artifacts:
  files:
    - target/devops.war

```

#### buildspec_infra.yml : 

```
version: 0.2

phases:
  install:
    runtime-versions:
      java: corretto11
  pre_build:
    commands:
      - echo "Download JQ"
      - curl -qL -o jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod +x ./jq
      - mv jq /usr/local/bin 
      - aws --version
      - ls -lrt
      - pwd
      - ls -lrt user-data.sh
      - aws ec2 run-instances --image-id "ami-053b0d53c279acc90" --count 1 --instance-type t2.micro --key-name "aws8amnv" --security-group-ids "sg-077fced5d5205d41f" --subnet-id "subnet-0385704f22e343550" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cbapp},{Key=Environment,Value=dev}]' --user-data file://user-data.sh
      - pwd
      - ls -lrta 
  build:
    commands:
      - echo "Executing Build Phase"
      - ls -lrt $CODEBUILD_SRC_DIR
      - cd $CODEBUILD_SRC_DIR
      - pwd
      - ls -lrta
      - aws s3 cp s3://8amcloudbinary/devops.war /usr/share/tomcat/webapps/
      - pwd
  post_build:
    commands:
      - echo "Infra Job is completed on `date`"
```

#### user-data.sh 

```
#!/bin/bash

# Update the Repository
sudo apt-get update

# Download, Install & Configure Ansible
sudo apt-get install git curl wget unzip software-properties-common -y 

sudo add-apt-repository --yes --update ppa:ansible/ansible

sudo apt-get install ansible -y 

# To Restart SSM Agent on Ubuntu 
sudo systemctl restart snap.amazon-ssm-agent.amazon-ssm-agent.service

# Attach Instance profile To EC2 Instance 
# aws ec2 associate-iam-instance-profile --iam-instance-profile Name=SA-EC2-SSM --instance-id ""

# Clone a Repo :
git clone https://gitlab.com/kesav.kummari/ansible-role-tomcat.git

# Go to repo
cd ansible-role-tomcat

# Execute the Playbook
ansible-playbook tomcat-setup.yml
```