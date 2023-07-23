#### Session Video:
    https://drive.google.com/file/d/1QkNAm2ZmN-Xbel3rQ1WFd5rjL-dAs1bz/view?usp=sharing

```
aws ec2 run-instances \
--image-id "ami-053b0d53c279acc90" \
--count 1 \
--instance-type t2.medium \
--key-name "aws8amnv" \
--security-group-ids "sg-077fced5d5205d41f" \
--subnet-id "subnet-0385704f22e343550" \
--user-data file://k8s-cp.sh \
--iam-instance-profile "Arn=arn:aws:iam::420815905200:instance-profile/8amSSMEC2" \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=k8s},{Key=Environment,Value=dev}]'

```

```
aws ec2 run-instances \
--image-id "ami-053b0d53c279acc90" \
--count 1 \
--instance-type t2.medium \
--key-name "aws8amnv" \
--security-group-ids "sg-077fced5d5205d41f" \
--subnet-id "subnet-0385704f22e343550" \
--user-data file://node1.sh \
--iam-instance-profile "Arn=arn:aws:iam::420815905200:instance-profile/8amSSMEC2" \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=k8s-node1},{Key=Environment,Value=dev}]'

```


##### 

STEP-1 :  Create deployment.yml

File Name : deployment.yml

STEP-2 : Create Service and Deploy:

File Name : nginx-service.yaml

kubectl create service nodeport nginx --tcp=80:80

kubectl apply -f deployment.yml

STEP-3 : Update the deployment with new version

File Name : deployment-update.yaml

kubectl apply -f deployment-update.yaml

STEP-4 : Scale the deployment

File Name : deployment-scale.yaml

kubectl apply -f  deployment-scale.yaml 

STEP-5 : Deleting a deployment 

kubectl delete deployment nginx-deployment


#### File Name : deployment.yml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80

```

#### Create Service 

```
---
apiVersion: v1
kind: Service
metadata:
  name: nginx
  namespace: default
  labels:
    app: nginx
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
spec:
  externalTrafficPolicy: Local
  ports:
    - name: http 
      port: 80
      protocol: TCP
      targetPort: 80
  selector:
    app: nginx
  type: LoadBalancer

...
```

#### Apply the Deployment and Service :

    kubectl create service nodeport nginx --tcp=80:80

    kubectl apply -f deployment.yml

    kubectl describe deployment nginx-deployment

    kubectl get svc

    kubectl get nodes

    kubectl get pods

#### Update your deployment

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.16.1 # Update the version of nginx from 1.14.2 to 1.16.1
        ports:
        - containerPort: 80

```

#### Scale Up / Down the deployment

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 4 # Update the replicas from 2 to 4
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80

```