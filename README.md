# goaccess-sitn

[GoAccess](https://goaccess.io/) configured for SITN.

## Local

```powershell
docker build -t sitn/goaccess .
cat access.03-10-2022.log | docker run --rm -i sitn/goaccess -a -o html - > report.html
```

## Deploy

1. Run:

```powershell
deploy.ps1
```

App is deployed and ready to be run by VCron.
