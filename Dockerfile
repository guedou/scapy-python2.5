FROM ubuntu
MAINTAINER Guillaume Valadon <guillaume@valadon.net>

# Install python 2.5 & modules and make it the default interpreter
RUN apt-get install -y software-properties-common && add-apt-repository ppa:fkrull/deadsnakes && \
    apt-get update && apt-get install -y python2.5 python2.5-dev wget gcc git && \
    ln -fs /usr/bin/python2.5 /usr/bin/python

# Install pycrypto
RUN wget https://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-2.6.1.tar.gz && \
    tar xvf /pycrypto-2.6.1.tar.gz && \
    cd pycrypto-2.6.1 && \
    ./configure && python setup.py build && python setup.py install

# Clone the git repository
RUN git clone https://github.com/guedou/scapy-python2.5 &&
    python --version
#    cd scapy/test && \
#    for f in *.uts; do \
#      ./run_tests -q -F -t $f -K netaccess || exit $?; \
#    done && \
#    for f in ../scapy/contrib/*.uts ; do \
#      ./run_tests -q -F -t $f -K netaccess -P "load_contrib('$(basename ${f/.uts})')" || exit $?; \
#    done
