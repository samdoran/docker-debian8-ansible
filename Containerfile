FROM debian:jessie
ENV container=docker
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        aptitude \
        bash \
        ca-certificates \
        curl \
        python-apt \
        python-pip \
        software-properties-common \
        sudo \
        systemd \
        systemd-cron \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

RUN pip install ansible q

RUN echo -e "localhost ansible_connection=local ansible_python_interpreter=/usr/bin/python" > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]
