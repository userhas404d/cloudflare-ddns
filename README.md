# CloudFlare DDNS

Python script running as a cronjob in Docker to update Cloudflare DNS records.

## Overview

Allows the user to specify a list of subdomains that will be dynamically updated and/or created against an existing Cloudflare zone.

Cloudflare domain proxying is enabled by default and is not currently configurable.

IPv6 addresses _should_ be supported but I have not tested this feature.

## Background

This project is heavily inspiried by [juusujanar's cloudflare-ddns](https://github.com/juusujanar/cloudflare-ddns) project and is largely a copy paste of
[this](example_update_dynamic_dns.py) example provided in the [cloudflare/python-cloudflare](https://github.com/cloudflare/python-cloudflare) repo.

## Usage

All that you will need to get started is the email address you used to sign up with Cloudflare, the name of your dns zone, the list of subdomains you would like to add to Cloudflare, and your Cloudflare api key.

This application is desinged to be run standalone or via Docker

### Docker

```bash
docker run --name "cloudflareddns" \
  -e "CF_ZONE_NAME=yourdomain.com" \
  -e "CF_DNS_NAMES=host1,host2,host3" \
  -e "CF_API_EMAIL=user@example.com" \
  -e "CF_API_KEY=00000000000000000000000000000000" \
  "userhas404d/cloudflareddns:latest"
```

### Standalone

Configure the following environment variables

```bash
export CF_ZONE_NAME="yourdomain.com"
export CF_DNS_NAMES="host1,host2,host3"
export CF_API_EMAIL='user@example.com'
export CF_API_KEY='00000000000000000000000000000000'
```

Configure your python env

```bash
pip install -r requirements.txt
```

And finally, run the application

```bash
python update-dynamic-dns.py
```

## But Why Tho

I'm a heavy [Unraid](https://unraid.net/) user and wanted to be able to use the wildcard option available in the [linuxserver/letsencrypt](https://hub.docker.com/r/linuxserver/letsencrypt/) docker. Unfortunately, that container's `DNSPLUGIN` option doesn't support my previous DNS provider.