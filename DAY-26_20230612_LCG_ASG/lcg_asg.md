#### Session Video:
    https://drive.google.com/file/d/1v8GrJkfNPuj322JufDbx41Hc_aAywv_O/view?usp=sharing
    
#### AWS Launch Configuration and Auto Scaling group:
```
    STEP-1 : First, log in to your AWS Management Console and navigate to the EC2 Dashboard.

    STEP-2 : From the EC2 Dashboard, click on "Launch Configurations" under the "Auto Scaling" section in the left-hand menu.

    STEP-3 : Click on the "Create launch configuration" button.

    STEP-4 : Choose your Amazon Machine Image (AMI), which is the template for your instance. 
             You can select one of the pre-built AMIs provided by AWS or create your own custom AMI.

    STEP-5 : Choose the instance type that you want to launch. 
             The instance type determines the resources that will be available to your instance, such as CPU, RAM, and network bandwidth.

    STEP-6 : Configure the details of your instance, such as the number of instances you want to launch, the security groups that you want to use, and any additional storage options.

    STEP-7 :  Set up your Auto Scaling group by selecting the desired minimum and maximum number of instances that should be running at any given time.

    STEP-8 : Configure your scaling policies. You can set up scaling policies based on metrics such as CPU utilization, network traffic, or custom metrics.

    STEP-9 : Set up notifications so that you receive alerts when your Auto Scaling group scales up or down.

    STEP-10 : Click on the "Create Auto Scaling group" button to complete the process.

That's it! Your Launch Configuration and Auto Scaling group are now set up and ready to use. 
AWS will automatically monitor your instances and adjust the number of instances in your group as needed to ensure that your application is running smoothly and efficiently.
```
