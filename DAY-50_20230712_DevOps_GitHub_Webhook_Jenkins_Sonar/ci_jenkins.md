#### Session Video:
    https://drive.google.com/file/d/1zv10F3Qg4P9i0sgSvSC3d5wQJC_g8m-i/view?usp=sharing

# Continuous Integration

```
GitHub :
    Repository : https://github.com/kesavkummari/cb9amjava/tree/b69am

    Branch : b69am

Maven Lifecycles :
    https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html


GitHub_Webhook 
```

####
    Jenkins supports two types of pipelines: 
    Scripted Pipeline and Declarative Pipeline. 
    Here's a brief overview of the differences between the two:

    Scripted Pipeline:
        - Uses a Groovy-based domain-specific language (DSL) to define pipelines
        - Allows for more fine-grained control and flexibility in pipeline execution
        - Supports conditional statements, loops, and other programming constructs
        - Requires a more advanced understanding of Groovy and Jenkins pipeline syntax
        - Can be more difficult to read and maintain, especially for larger pipelines

    Declarative Pipeline:
        - Uses a simpler, more structured syntax for defining pipelines
        - Provides a more standardized, easier-to-read format for pipeline code
        - Supports pre-defined stages, steps, and post actions for common pipeline tasks
        - Allows for easier integration with external tools and services
        - Is more accessible to less experienced Jenkins users
        - May require more effort to customize for specific use cases

    In general, Scripted Pipeline is a better choice for complex pipelines with advanced logic and customization needs, while Declarative Pipeline is better for simpler pipelines with standardized workflows and easier maintenance requirements.


#### Scripted Pipeline


```
node {
    stage('Checkout') {
        // Checkout the code from a version control system
        // For example, from a Git repository:
        git 'https://github.com/username/repo.git'
    }

    stage('Build') {
        // Set up the environment
        def javaHome = tool 'JDK'
        env.JAVA_HOME = javaHome
        env.PATH = "${javaHome}/bin:${env.PATH}"

        // Build the application using Maven
        sh "${mvnHome}/mvn clean package"
    }

    stage('Test') {
        // Run unit and integration tests
        sh "${mvnHome}/mvn test"
    }

    stage('Deploy') {
        // Deploy the application to a test environment
        sh "${mvnHome}/mvn deploy"
    }
}

```

```
node {
   def mvnHome
  stage('Prepare') {
      git url: 'https://github.com/kesavkummari/javacodescan.git', branch: 'main'
      mvnHome = tool 'maven'
   }
  stage ('Code Quality') {
      sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore sonar:sonar"
  }

  stage ('Clean') {
      sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean"
  }
  stage ('Validate') {
      sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore validate"
  }
  stage ('Compile') {
      sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore compile"
  }
  stage ('Test') {
      sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore test"
  }
  stage ('Package') {
      sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore package"
  }
  stage ('Verify') {
      sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore verify"
  }
  stage ('Install') {
      sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore install"
  }
  stage ('Deliver & Deployment') {
      sh 'curl -u admin:redhat@123 -T target/**.war "http://3.87.125.112:8080/manager/text/deploy?path=/kesav&update=true"'
  }
  stage ('SmokeTest') {
      sh 'curl --retry-delay 10 --retry 5 "http://3.87.125.112:8080/kesav"'
  }
}
```

#### Declarative Pipeline

```
pipeline {
    agent any

    tools {
        // Configure the JDK and Maven tools
        jdk 'JDK'
        maven 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from a version control system
                // For example, from a Git repository:
                git 'https://github.com/username/repo.git'
            }
        }

        stage('Build') {
            steps {
                // Build the application using Maven
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                // Run unit and integration tests
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application to a test environment
                sh 'mvn deploy'
            }
        }
    }
}

```

```
pipeline {
    agent any 
    tools {
         maven 'maven'
         jdk 'java'
    }
    stages {
         stage('Stage-0 : Static Code Analysis Using SonarQube') { 
           steps {
                sh 'mvn clean verify sonar:sonar -DskipTests'
            }
        }
        stage('Stage-1 : Clean') { 
            steps {
                sh 'mvn clean'
            }
        }
         stage('Stage-2 : Validate') { 
            steps {
                sh 'mvn validate'
            }
        }
         stage('Stage-3 : Compile') { 
            steps {
                sh 'mvn compile'
            }
        }
         stage('Stage-4 : Test') { 
            steps {
                sh 'mvn test -DskipTests'
            }
        }
          stage('Stage-5 : Install') { 
            steps {
                sh 'mvn install -DskipTests'
            }
        }
          stage('Stage-6 : Verify') { 
            steps {
                sh 'mvn verify -DskipTests'
            }
        }
          stage('Stage-7 : Package') { 
            steps {
                sh 'mvn package -DskipTests'
            }
        }

           stage('Stage-8 : Deploy an Artifact to Artifactory Manager i.e. Nexus/Jfrog') { 
            steps {
                sh 'mvn deploy -DskipTests'
            }
        }

          stage('Stage-9 : Deployment - Deploy a Artifact devops-3.0.0-SNAPSHOT.war file to Tomcat Server') { 
            steps {
                sh 'curl -u admin:Str0ngAdminPassw3rd -T target/**.war "http://54.166.230.167:8080/manager/text/deploy?path=/devops&update=true"'
            }
        } 
  
          stage('Stage-10 : SmokeTest') { 
            steps {
                sh 'curl --retry-delay 10 --retry 5 "http://54.166.230.167:8080/devops"'
            }
        }

  
    }
}
```



