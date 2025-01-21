FROM arm64v8/ubuntu

# Install dependencies
RUN apt update
RUN apt install git cmake pkg-config libusb-1.0-0-dev build-essential -y

# Get driver repository
RUN git clone https://github.com/rtlsdrblog/rtl-sdr-blog

# Compile drivers
RUN cd rtl-sdr-blog && \
        mkdir build && \
        cd build && \
        cmake ../ -DINSTALL_UDEV_RULES=ON && \
        make && \
        make install && \
        ldconfig

# Execute RTL server
ENTRYPOINT ["rtl_tcp", "-D", "-a", "0.0.0.0"]
