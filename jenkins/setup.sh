docker run --name jenkins --rm -d -p 8080:8080  \
       --env JAVA_OPTS="-Dhudson.Main.development=true \
       -Djenkins.install.runSetupWizard=false \
       -Dhudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION=true" \
       taksan/jenkins:v1.0.0

touch /tmp/jenkins-up
