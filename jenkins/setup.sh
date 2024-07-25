docker run --name jenkins --rm -d -p 8080:8080  \
       --env JAVA_OPTS="-Dhudson.Main.development=true -Djenkins.install.runSetupWizard=false -Dhudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION=true" \
       jenkins/jenkins:alpine3.20-jdk21

touch /tmp/jenkins-up
