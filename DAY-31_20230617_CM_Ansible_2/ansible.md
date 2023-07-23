#### Session Video :
    https://drive.google.com/file/d/1vlOT2wLoOuPOl3RXvHousbFFw6w_gKBt/view?usp=sharing


#### Ansible ad-hoc commands allow you to perform quick, one-time tasks on remote hosts without the need for a playbook. 

Here are some examples of commonly used Ansible ad-hoc commands:

#### Ping: Check the reachability of remote hosts.
```
ansible <hosts> -m ping
```

#### Command: Execute a command on remote hosts.
```
ansible <hosts> -m command -a "<command>"

ansible web -m command -a "uname -a"
ansible web -m command -a "cat /etc/os-release"
ansible web -m command -a "df -TH"
ansible web -m command -a "free"
ansible web -m command -a "cat /proc/cpuinfo"
ansible web -m command -a "cat /proc/meminfo"
ansible web -m command -a "systemctl status sshd"
ansible web -m command -a "sudo systemctl status sshd"
ansible web -m command -a "apt-get update"
ansible web -m command -a "sudo apt-get install tree -y"
ansible web -m command -a "sudo apt-get install wget curl git -y"
```

#### Shell: Run a shell command on remote hosts.
```
ansible <hosts> -m shell -a "<command>"
```

#### Copy: Copy a file to remote hosts
```
ansible <hosts> -m copy -a "src=<source_file> dest=<destination_file>"
```

#### Fetch: Retrieve a file from remote hosts
```
ansible <hosts> -m fetch -a "src=<source_file> dest=<destination_directory>"
```

#### Service: Manage services on remote hosts.
```
ansible <hosts> -m service -a "name=<service_name> state=<started|stopped|restarted>"
```

#### File: Manage files and directories on remote hosts.
```
ansible <hosts> -m file -a "path=<path_to_file_or_directory> state=<file_state>"
```

#### Package: Manage packages on remote hosts.
```
ansible <hosts> -m package -a "name=<package_name> state=<present|absent>"
```

#### Yum: Manage packages using Yum package manager.
```
ansible <hosts> -m yum -a "name=<package_name> state=<installed|latest|removed>"
```

#### Apt: Manage packages using Apt package manager.
```
ansible <hosts> -m apt -a "name=<package_name> state=<installed|latest|removed>"
```


```
---
- name: Play-1 Setting Hostname 
  hosts: web  
  become: yes
  tasks:
    - name: Update the Ubuntu Repository
      apt: update_cache=yes
      ignore_errors: yes

    - name: Set Timezone 
      command: timedatectl set-timezone Asia/Kolkata
...

```

```
---
- name: Play-1 Configure NTP 
  hosts: web
  become: yes
  tasks:
    - name: Update Ubuntu Repository
      apt: update_cache=yes
      ignore_errors: yes
      
    - name: Install NTP Server
      apt: name=ntp state=present 

    - name: Enable and Start NTP Service 
      service: name=ntp state=restarted 
...

```

```
---
- name: Play-1  
  hosts: web 
  become: yes
  tasks:
    - name: Update the Ubuntu Repository
      apt: update_cache=yes
      ignore_errors: yes

    - name: Set Timezone 
      command: timedatectl set-timezone Asia/Kolkata

    - name: Install NTP Server
      apt: name=ntp state=present 

    - name: Enable and Start NTP Service 
      service: name=ntp state=restarted 

    - name: Web Server Apache2
      apt: name=apache2 state=present   # apt install apache2 -y 

    - name: Enable & Start Apache2 Server 
      service: name=apache2 state=restarted 

    - lineinfile:
         path: /var/www/html/index.html 
         line: 'Welcome To Cloud Binary DevOps Team'
...
```
