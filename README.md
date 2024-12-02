# Docker build for my site

## Links

* Hosted version: [hereismy.space](https://hereismy.space).
* [Backend](https://github.com/dzen03/hereismy.space-backend.git)
* [Frontend](https://github.com/dzen03/hereismy.space-frontend.git)

## Cloning

```bash
git clone --recurse-submodules https://github.com/dzen03/hereismy.space.git
```

## Building and running

Place your db into `db` or change mount inside [`docker-compose.yml`](docker-compose.yml).
Also, you can change the port binding from 80 to whatever you want.

```bash
docker compose up --build -d
```
