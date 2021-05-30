FROM neuroforlunch/gnuradio-companion-plus:p3-gnuradio-darkmode


RUN apt-get -yq install \
  ocl-icd-libopencl1 \
  ocl-icd-opencl-dev \
  opencl-c-headers \
  opencl-clhpp-headers \
  opencl-headers \
  pocl-opencl-icd \
  python3-pyopencl \
  xorg-dev \
  libglu1-mesa-dev \
  libdrm-dev \
  libxfixes-dev \
  libxext-dev \
  libtinfo-dev \
  libedit-dev \
  zlib1g-dev



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


# Install gr-fosphor-vm for intel
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/NeuroForLunch/gr-fosphor-vm.git --branch maint-3.8-generic \
  && cd gr-fosphor-vm \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/
