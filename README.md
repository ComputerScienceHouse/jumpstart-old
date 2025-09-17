# Jumpstart

A graphical interface that displays important information at the entrance of CSH.

See it live [here](https://jumpstart.csh.rit.edu)!

## Install

This project uses [Python](http://nodejs.org), [Flask](https://npmjs.com), SQL, HTML/CSS, and Javascript. 

1. Clone and cd into the repo: `git clone https://github.com/ComputerScienceHouse/Jumpstart`
2. Run `pip install -r requirements.txt`
3. Ask opcomm for secrets
    - The secrets package follows the directory structure:
    src/
      secrets/
        client_secrets.json
4. Run `flask --app jumpstart run`
5. Results

Jumpstart expects the following environment variables to be defined:
```
FLASK_APP=jumpstart:App
JUMPSTART_API_KEYS=KEYS
TZ=TIMEZONE
SENTRY_DSN=LINK
```
## Docker

1. Ensure you are in the project root, then build the image locally with `docker built -t jumpstart .`
2. Run with the following: (Be sure to update env variables)
```
docker run \
    -e FLASK_RUN_HOST=0.0.0.0 \
    -e FLASK_APP=jumpstart:App \
    -e JUMPSTART_API_KEYS=KEYS \
    -e TZ=America/New_York \
    -e SENTRY_DSN=LINK \
    -e GUNICORN_CMD_ARGS="-b=0.0.0.0:5000" \
    -v ./secrets:/usr/local/jumpstart/secrets \
    -p 5000:5000 \
    jumpstart
```