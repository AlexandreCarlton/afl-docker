FROM centos:7

RUN yum install -y \
      centos-release-scl \
      epel-release

RUN yum install -y \
      curl \
      @'Development Tools' && \
    yum clean all

ARG AFL_VERSION
RUN curl -L "http://lcamtuf.coredump.cx/afl/releases/afl-$AFL_VERSION.tgz" \
    | tar --extract --gzip && \
    sed -i 's:#define USE_COLOR:// #define USE_COLOR:' /afl-$AFL_VERSION/config.h && \
    make -C /afl-$AFL_VERSION -j install && \
    rm -rf /afl-$AFL_VERSION

# We set AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES and AFL_SKIP_CPUFREQ
# since we cannot respectively do without sudo privileges:
#   echo core >/proc/sys/kernel/core_pattern
# and
#   cd /sys/devices/system/cpu
#   echo performance | tee cpu*/cpufreq/scaling_governor
ENV AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1 \
    AFL_SKIP_CPUFREQ=1 \
    CC=afl-gcc \
    CXX=afl-g++
