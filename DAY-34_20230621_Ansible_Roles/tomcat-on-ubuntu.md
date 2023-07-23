#### vi tomcat.service.j2
```
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=root
Group=root
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target

```

#### vi context.xml.j2
```
<?xml version="1.0" encoding="UTF-8"?>
<Context antiResourceLocking="false" privileged="true" >
</Context>

```

#### vi tomcat-users.xml.j2
```
<?xml version="1.0" encoding="UTF-8"?>
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">
<!-- user manager can access only manager section -->
<role rolename="manager-gui" />
<user username="{{ ui_manager_user }}" password="{{ ui_manager_pass }}" roles="manager-gui" />
<!-- user admin can access manager and admin section both -->
<role rolename="admin-gui" />
<user username="{{ ui_admin_username }}" password="{{ ui_admin_pass }}" roles="manager-gui,admin-gui" />
</tomcat-users>

```


#### vi tomcat.yml

```
# Ansible Apache Tomcat Playbook
---
- name: Install Tomcat
  hosts: tomcat
  become: true

  vars:
    tomcat_version: 8.5.90
    tomcat_install_dir: /opt/tomcat
    tomcat_service_name: tomcat
    ui_manager_user: manager
    ui_manager_pass: Manager@123
    ui_admin_username: admin
    ui_admin_pass: redhat@123

  tasks:
    - name: Install Java
      apt: update_cache=yes
      ignore_errors: yes

    - name: Install Java
      apt:
        name: default-jdk
        state: present

    - name: Add tomcat group
      group:
        name: tomcat

    - name: Add "tomcat" user
      user:
        name: tomcat
        group: tomcat
        home: /usr/share/tomcat
        createhome: no
        system: yes

    - name: Create Tomcat install directory
      file:
        path: "{{ tomcat_install_dir }}"
        state: directory
        mode: 0755
        owner: tomcat
        group: tomcat

    - name: Download Tomcat archive
      get_url:
        url: "https://downloads.apache.org/tomcat/tomcat-8/v{{ tomcat_version }}/bin/apache-tomcat-{{ tomcat_version }}.tar.gz"
        dest: /tmp/apache-tomcat-{{ tomcat_version }}.tar.gz

    - name: Extract tomcat archive
      unarchive:
       src: /tmp/apache-tomcat-{{ tomcat_version }}.tar.gz
       dest: /opt/tomcat
       owner: tomcat
       group: tomcat
       remote_src: yes
       extra_opts: "--strip-components=1"
       creates: /opt/tomcat/bin

    - name: Set Tomcat ownership
      file:
        path: "{{ tomcat_install_dir }}"
        state: directory
        mode: 0755
        owner: tomcat
        group: tomcat
        recurse: yes

    - name: Create Tomcat service file
      template:
        src: tomcat.service.j2
        dest: /etc/systemd/system/{{ tomcat_service_name }}.service

    - name: Set UI access credentials
      template:
        src: tomcat-users.xml.j2
        dest: /opt/tomcat/conf/tomcat-users.xml

    - name: Allow access to Manager and Host Manager apps from any IP
      template:
        src: context.xml.j2 
        dest: "{{ item }}"
      with_items:
        - /opt/tomcat/webapps/host-manager/META-INF/context.xml
        - /opt/tomcat/webapps/manager/META-INF/context.xml

    #- name: Download file from S3 bucket
    #  s3_sync:
    #    bucket: s3://8amcloudbinary/
    #    download: yes
    #    dest: /opt/tomcat/webapps/devops.war
    #    s3_region: us-east-1
    #    s3_endpoint_url: https://8amcloudbinary.s3.amazonaws.com/devops.war
    #    delete: no

    - name: Download artifact
      get_url:
        url: https://gitlab.com/kesav.kummari/ansible-role-tomcat/-/raw/main/tomcat/files/devops.war
        dest: /opt/tomcat/webapps/devops.war
        mode: '0644'

    - name: Start Tomcat service
      systemd:
        name: "{{ tomcat_service_name }}"
        state: started
        enabled: yes

```#### vi tomcat.service.j2
```
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=root
Group=root
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target

```

#### vi context.xml.j2
```
<?xml version="1.0" encoding="UTF-8"?>
<Context antiResourceLocking="false" privileged="true" >
</Context>

```

#### vi tomcat-users.xml.j2
```
<?xml version="1.0" encoding="UTF-8"?>
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">
<!-- user manager can access only manager section -->
<role rolename="manager-gui" />
<user username="{{ ui_manager_user }}" password="{{ ui_manager_pass }}" roles="manager-gui" />
<!-- user admin can access manager and admin section both -->
<role rolename="admin-gui" />
<user username="{{ ui_admin_username }}" password="{{ ui_admin_pass }}" roles="manager-gui,admin-gui" />
</tomcat-users>

```


#### vi tomcat.yml

```
# Ansible Apache Tomcat Playbook
---
- name: Install Tomcat
  hosts: tomcat
  become: true

  vars:
    tomcat_version: 8.5.90
    tomcat_install_dir: /opt/tomcat
    tomcat_service_name: tomcat
    ui_manager_user: manager
    ui_manager_pass: Manager@123
    ui_admin_username: admin
    ui_admin_pass: redhat@123

  tasks:
    - name: Install Java
      apt: update_cache=yes
      ignore_errors: yes

    - name: Install Java
      apt:
        name: default-jdk
        state: present

    - name: Add tomcat group
      group:
        name: tomcat

    - name: Add "tomcat" user
      user:
        name: tomcat
        group: tomcat
        home: /usr/share/tomcat
        createhome: no
        system: yes

    - name: Create Tomcat install directory
      file:
        path: "{{ tomcat_install_dir }}"
        state: directory
        mode: 0755
        owner: tomcat
        group: tomcat

    - name: Download Tomcat archive
      get_url:
        url: "https://downloads.apache.org/tomcat/tomcat-8/v{{ tomcat_version }}/bin/apache-tomcat-{{ tomcat_version }}.tar.gz"
        dest: /tmp/apache-tomcat-{{ tomcat_version }}.tar.gz

    - name: Extract tomcat archive
      unarchive:
       src: /tmp/apache-tomcat-{{ tomcat_version }}.tar.gz
       dest: /opt/tomcat
       owner: tomcat
       group: tomcat
       remote_src: yes
       extra_opts: "--strip-components=1"
       creates: /opt/tomcat/bin

    - name: Set Tomcat ownership
      file:
        path: "{{ tomcat_install_dir }}"
        state: directory
        mode: 0755
        owner: tomcat
        group: tomcat
        recurse: yes

    - name: Create Tomcat service file
      template:
        src: tomcat.service.j2
        dest: /etc/systemd/system/{{ tomcat_service_name }}.service

    - name: Set UI access credentials
      template:
        src: tomcat-users.xml.j2
        dest: /opt/tomcat/conf/tomcat-users.xml

    - name: Allow access to Manager and Host Manager apps from any IP
      template:
        src: context.xml.j2 
        dest: "{{ item }}"
      with_items:
        - /opt/tomcat/webapps/host-manager/META-INF/context.xml
        - /opt/tomcat/webapps/manager/META-INF/context.xml

    #- name: Download file from S3 bucket
    #  s3_sync:
    #    bucket: s3://8amcloudbinary/
    #    download: yes
    #    dest: /opt/tomcat/webapps/devops.war
    #    s3_region: us-east-1
    #    s3_endpoint_url: https://8amcloudbinary.s3.amazonaws.com/devops.war
    #    delete: no

    - name: Download artifact
      get_url:
        url: https://gitlab.com/kesav.kummari/ansible-role-tomcat/-/raw/main/tomcat/files/devops.war
        dest: /opt/tomcat/webapps/devops.war
        mode: '0644'

    - name: Start Tomcat service
      systemd:
        name: "{{ tomcat_service_name }}"
        state: started
        enabled: yes

```
