# Jumpstart

A graphical interface that displays important information at the entrance of CSH.

See it live [here](https://jumpstart.csh.rit.edu)!

## Install

This project uses [Python](http://nodejs.org), [Flask](https://npmjs.com), SQL, HTML/CSS, and Javascript. 

1. Clone and cd into the repo: `git clone https://github.com/ComputerScienceHouse/Jumpstart`
2. Run `pip install -r requirements.txt` (or use docker)
3. Ask opcomm for secrets
  - Google clients secret json
    - The secrets package follows the directory structure:
    src/
      secrets/
        client_secrets.json
  - Jumpstart API keys
4. Run `flask --app jumpstart run` (please use docker)
5. Results

Jumpstart expects the following environment variables to be defined:
```
JUMPSTART_API_KEYS=KEYS # For authenticating slack bot
TZ=TIMEZONE
SENTRY_DSN=LINK # Don't need for local development
```
## Docker

1. Ensure you are in the project root, then build the image locally with `docker built -t jumpstart .`
2. Run with the following: (Be sure to update env variables)
```
docker run \
    -e JUMPSTART_API_KEYS=KEYS \
    -e TZ=America/New_York \
    -e SENTRY_DSN=LINK \
    -p 8080:8080 \
    -v ./secrets:/usr/local/jumpstart/secrets \
    jumpstart
```
3. You can also use a `.env` file:
```
docker run \
    --env-file='.env' \
    -p 8080:8080 \
    -v ./secrets:/usr/local/jumpstart/secrets \
    jumpstart
```
