# MyHomeEnergyPlanner Continuous Integration - Continuous Deployment (CI-CD)

## Continuous Integration (CI)
CI has been implemented with Travis. The github app has been added to the emoncms/myhomeenergyplanner repository

The building is happening in travis-ci.com

The Travis build:
- installs apache server
- installs swiftmailer
- installs emoncms
- sets up a database
- creates emonCMS settings.php (beware no SMTP set up)
- installs Carbon Co-op theme
- installs MHEP
- sets up testing suite
- runs tests:
    - create first emonCMS user and login
    - MHEP tests

Tests are only run in Firefox (ToDo Chrome)

## Continuous deployment (CD)
Deployment happens only when pushing to the "production" branch. The deployment script is in travis-CICD/deply.sh

The script will ssh the server using credentials (PRODUCTION_SERVER_USER and PRODUCTION_SERVER) defined in the repository settings in Travis. It triggers another script in the server that does the rest.

