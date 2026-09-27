# rpz-pi

Lightweight ad-blocking DNS: Unbound + [Hagezi](https://github.com/hagezi/dns-blocklists) RPZ blocklist.

## Install

On your Raspberry Pi:

```bash
git clone <this repo> && cd rpz-pi
sudo apt build-dep ./
dpkg-buildpackage --build=binary --no-sign
sudo apt install ../rpz-pi_1.0.0_all.deb
```

Then set your Raspberry Pi as the DNS server in your router.

## Allow a domain

If a site you need is blocked, add it to the end of `/etc/unbound/allowlist.rpz`:

```
example.com CNAME rpz-passthru.
```

Then reload the allowlist:

```bash
sudo unbound-control auth_zone_reload allowlist
```

## Build on a Mac

Use an Apple [container machine](https://github.com/apple/container/blob/main/docs/container-machine.md):

```bash
container build --tag local/rpz-pi-machine .
container machine create local/rpz-pi-machine --name rpz-pi
container machine run --name rpz-pi --workdir "$PWD" -- dpkg-buildpackage --build=binary --no-sign --check-command=lintian
```

The package is written to the parent directory.

## Remove

```bash
sudo apt purge rpz-pi
```
