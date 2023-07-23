#### Session Video:
    https://drive.google.com/file/d/15EMlIvPpgeeISpudVGrpp_tPUf4FGniJ/view?usp=sharing

```
STEP-1 : Login to Account-A & Account-B

STEP-2 : Go to Account-B & Create Role i.e. DevEc2Role 
Trusted entity type : AWS Account
Another AWS account : 191323423716 (Account-A)
Attach Permissions policies :  AmazonEC2ReadOnlyAccess
Role name : DevEc2Role 

STEP-3 : Go to Account-A & Create a Policies 
Policy Name : AWS_AssumeRolePolicy
Select a service : sts
Access level : Write --> AssumeRole
Resources: Add Arn (Add Account-B(420815905200) & RoleName(DevEc2Role))

Policy name : AWS_AssumeRolePolicy
 
STEP-4 : Create Group(AWS_AssumeRolePolicy) & Add user(Joel) to group in Account-A

STEP-5 : Go to Account-A and Policies --> Policy name : AWS_AssumeRolePolicy & Select Radio Buttion & Click on Action --> Attach --> Select Existing Group --> AWS_AssumeRolePolicy

STEP-6 : Login to AWS as I AM user i.e. joel & Switch account.

Account Name/ID : 420815905200
Role Name: DevEc2Role
Display Name: Any Name 

```