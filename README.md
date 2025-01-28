# bmp_docker

## Overview
This Docker configuration lets you run the BLE-Micro-Pro-WebConfigurator on your local machine, allowing you to flash any version of bootloader and application firmware onto your BLE Micro Pro (BMP).

## Environment
* OS: Ubuntu
* Docker version: 24.0.2


## Installation
Clone the repository and build the docker container:
```
git clone https://github.com/Banana-Tachi/bmp_docker.git
docker compose build
docker compose up -d
```

## Setting
1. Access the container shell:
```
docker compose exec bmp_docker /bin/bash
```

2. Clone and configure the Web Configurator (checkout your desired version):
```
git clone https://github.com/sekigon-gonnoc/BLE-Micro-Pro-WebConfigurator.git
cd BLE-Micro-Pro-WebConfigurator/
git checkout <desired-version>
yarn install
```

3. Add server configuration to ```BLE-Micro-Pro-WebConfigurator/vite.config.js```:

```
  server: {
    host: '0.0.0.0',
  }
```
Example

```
import { defineConfig } from "vite";
import elmPlugin from "vite-plugin-elm";

export default defineConfig({
  plugins: [elmPlugin()],
  base: "/BLE-Micro-Pro-WebConfigurator/",
  build: {
    outDir: "dist",
  },
  server: {
    host: '0.0.0.0',
  }
});
```
4. Install dependencies:
```
yarn install
```

## Using
1. In the container shell, start the development server:
```
cd /work/BLE-Micro-Pro-WebConfigurator/
yarn dev
```

2. Open your host machine's web browser and navigate to:
http://localhost:5173


## Help
### Docker Commands Reference

* Check container status: ```docker ps```
* Start container: ```docker start bmp_docker```
* Access container shell: ```docker compose exec bmp_docker /bin/bash```
* Exit container shell: ```exit```
* Stop container: ```docker stop bmp_docker```
