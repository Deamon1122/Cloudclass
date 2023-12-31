#### Session Video:
    https://drive.google.com/file/d/10LLBuEHCi-5xMt3T4VFCsX6O5VXKsPvb/view?usp=sharing

#### Ansible Roles

https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html

```
---
- name: Play-1 - Tomcat
  hosts: app  # ---> /etc/ansible/hosts [app] publicip or hostname of the tomcat
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

    - name: Installating JDK.
      apt: name=default-jdk state=latest

    - name: Adding Group and user for Tomcat.
      shell: groupadd tomcat && useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
      
    - name: Installating curl.
      apt: name=curl state=latest

    - name: Downloading Apache Tomcat tar.
      shell: wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.75/bin/apache-tomcat-8.5.75.tar.gz    
      args:
        chdir: /tmp

    - name: Creating Apache Tomcat home directory.
      command: mkdir /opt/tomcat

    - name: Extracting Apache Tomcat.
      shell: tar -xzvf /tmp/apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1

    - name: Updating permission.
      command: "{{ item }}"
      with_items:
        - chown -R tomcat:tomcat /opt/tomcat
        - chmod -R g+r /opt/tomcat/conf
        - chmod g+x /opt/tomcat/conf

    - name: Creating service for Apache tomcat.
      file:
        path: /etc/systemd/system/tomcat.service
        state: touch
        mode: u+rwx,g-rwx,o-x

    - name: Upload a tomcat.service file unto /etc/systemd/system/
      get_url:
        src: ./tomcat.service
        dest: /etc/systemd/system/tomcat.service

    - name: Deamon reload.
      command: systemctl daemon-reload

    - name: Starting Apache Tomcat service.
      service: name=tomcat state=started

...
```