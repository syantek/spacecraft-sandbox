FROM ubuntu:22.04

# Install trick requirements
RUN apt-get update && apt-get install -y \
bison \
clang \
flex \
git \
llvm \
make \
maven \
swig \
cmake \
curl \
g++ \
libx11-dev \
libxml2-dev \
libxt-dev \
libmotif-common \
libmotif-dev \
python3-dev \
zlib1g-dev \
llvm-dev \
libclang-dev \
libudunits2-dev \
libgtest-dev \
openjdk-11-jdk \
zip

ENV PYTHON_VERSION=3

# ------------------------------------------------------------------------------
# Get Trick version 19.6.0 from GitHub, configure and build it.
# ------------------------------------------------------------------------------
# We want to clone Trick into the /apps directory of our image.
WORKDIR /apps
# Get the 19.6.0 tag (an official release) of Trick from Github.
RUN git clone --depth 1 --branch 19.6.0 https://github.com/nasa/trick.git
# cd into the directory we just created and ..
WORKDIR /apps/trick
# configure and make Trick.
RUN ./configure && make

# ------------------------------------------------------------------------------
# Add ${TRICK_HOME}/bin to the PATH variable.
# ------------------------------------------------------------------------------
ENV TRICK_HOME="/apps/trick"
RUN echo "export PATH=${PATH}:${TRICK_HOME}/bin" >> ~/.bashrc

# ------------------------------------------------------------------------------
# Get JEOD version 5.1 from GitHub and set necessary environment variables
# ------------------------------------------------------------------------------
# We want to clone JEOD into the /apps directory of our image.
WORKDIR /apps
# Get the 5.1 tag (an official release) of JEOD from Github.
RUN git clone --depth 1 --branch jeod_v5.1 https://github.com/nasa/jeod.git
# set relevant environment variables
ENV JEOD_HOME="/apps/jeod"
RUN echo "export TRICK_CFLAGS=${TRICK_CLFAGS}' -I${JEOD_HOME}/models'" >> ~/.bashrc
RUN echo "export TRICK_CXXFLAGS=${TRICK_CXXLFAGS}' -I${JEOD_HOME}/models'" >> ~/.bashrc

# ------------------------------------------------------------------------------
# Clone the spacecraft_sandbox repository to work in
# ------------------------------------------------------------------------------
# clone into /home in the image
WORKDIR /home
RUN git clone https://github.com/syantek/spacecraft-sandbox.git #git@github.com:syantek/spacecraft-sandbox.git

CMD ["/bin/bash"]