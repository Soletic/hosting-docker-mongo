# Docker image used for Mongo

Based on the [open source docker image](https://github.com/sameersbn/docker-redmine).

We built this image to port compatibility of the mongo docker image in VPS Host designing by Sol&TIC

## Running the container

For the firstime, you have to set the admin user. Log in to he container and run :

```
$ PASS=$(pwgen -s 12 1) && mongo --eval "db.getSiblingDB('admin').createUser({user: 'admin', pwd: '$PASS', roles: [{ role: 'userAdminAnyDatabase', db: 'admin' }]})"
$ mongo -u "admin" -p "$PASS" --authenticationDatabase "admin" --eval "db.getSiblingDB('kw_exams_app').createUser({user: 'admin', pwd: '$PASS', roles: [{ role: 'dbOwner', db: 'kw_exams_app' }]})"
$ echo "admin:$PASS" > /data/db/credentials
```

## Roadmap

* Auto init users admin when image is started the first time