# captive-redirect

A simple web page I can use for captive portals.

# Building and Deploying

1. Bring up the stack: `docker-compose up -d`
2. Check that `test` has exited 0: `docker-compose ps test`
2. Deploy! `ENV_PASSWORD=<env_decrypt_password> scripts/deploy.sh`
