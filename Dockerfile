FROM centos:6.10

LABEL maintainer="pe.weeble@yahoo.fr"

RUN yum install -y \
      epel-release auto{conf,make} ctags elfutils \
      gcc{,-c++} gettext intltool libtool make patch{,utils} tar \
      redhat-rpm-config rpm-{build,sign} rpmdevtools spectool git yum-utils sudo \
    && yum clean all

RUN adduser rpmbuilder -G wheel -d /home/rpmbuilder -u 1000

COPY etc/sudoers.d/wheel /etc/sudoers.d/
RUN sed -i '/Defaults\s+requiretty/c\#Defaults\s+requiretty' /etc/sudoers \
    && chown -R root:root /etc/sudoers.d/ \
    && chmod 0440 /etc/sudoers.d/wheel

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER rpmbuilder
RUN rpmdev-setuptree

ENTRYPOINT [ "/entrypoint.sh", "rpmbuild"]
