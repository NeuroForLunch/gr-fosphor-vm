FROM neuroforlunch/gnuradio-companion-plus:p4

RUN apt-get install -yq \
  xorg-dev \
  libglu1-mesa-dev \
  nvidia-opencl-dev \
  opencl-headers \
  clinfo

  
# Install GLFW
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/glfw/glfw.git \
  && cd glfw \
  && mkdir build \
  && cd build \
  && cmake -DBUILD_SHARED_LIBS=true .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


# Install gr-fosphor-vm for nvidia
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/NeuroForLunch/gr-fosphor-vm.git --branch maint-3.8-nvidia \
  && cd gr-fosphor-vm \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/
