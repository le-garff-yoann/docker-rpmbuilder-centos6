FROM centos:6.10

LABEL maintainer="pe.weeble@yahoo.fr"

RUN yum install -y \
      epel-release auto{conf,make} ctags elfutils \
      gcc{,-c++} gettext intltool libtool make patch{,utils} tar \
      redhat-rpm-config rpm-{build,sign} rpmdevtools spectool git yum-utils \
    && yum clean all

RUN rpmdev-setuptree

ENTRYPOINT [ "rpmbuild" ]
