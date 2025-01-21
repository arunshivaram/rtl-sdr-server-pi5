
### Changes in this fork were targeted for an RTL-SDR Blog V.3. dongle used on Raspberry Pi 5

 - Uses arm64v8/ubuntu instead of arm32v7/ubuntu, as the latter is not supported on on Raspbeery Pi5
 - Uses drivers and tools from rtlsdrblog, instead of osmocom as additional features like direct sampling are supported in the v3 dongle with their drivers (https://www.rtl-sdr.com/rtl-sdr-blog-v-3-dongles-user-guide/)
 - Direct sampling mode is enabled when strating rtl_tcp

--------------------------------------------------------------------------------------------------------
### README from the original repo below 

### Dockerized RTL-SDR server for Raspberry Pi

This Dockerfile allows you to easily deploy a native RTL-SDR server using Docker in your Raspberry Pi

#### Instructions

1. It's needed to block certain kernel modules to get the RTL-SDR device work properly. Place the `blacklist-rtl.conf` file into your host `/lib/modprobe.d/` folder:
```
cp ./files/blacklist-rtl.conf /lib/modprobe.d/
```

2. Additionally, we need to set the correct permissions to the modules for allowing TCP messages. Place the `rtl_sdr.rules` file into your host `/etc/udev/rules.d/` folder:
```
cp ./files/rtl_sdr.rules /etc/udev/rules.d/
```

3. Reboot your Raspberry Pi, this should only have to be done once.

4. Run the container using the `docker-compose` file included here:
```
docker-compose up -d --build rtl-server
```

5. The server is listening on port `1234`, connect to it using your RTL-SDR client (i.e. SDRSharp) and the IP of the Raspberry device.
```
sdr://<raspberry-ip>:1234
```

6. Enjoy and open an issue or collaborate with a PR if anything is not working as expected.
