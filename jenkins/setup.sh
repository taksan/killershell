docker run --name jenkins --rm -d -p 443:8080  \
       --env JAVA_OPTS="-Dhudson.Main.development=true -Djenkins.install.runSetupWizard=false" \
       jenkins/jenkins:alpine3.20-jdk21

touch /tmp/jenkins-up
