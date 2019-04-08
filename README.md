# docker-rpmbuilder-centos6

[![pipeline status](https://gitlab.com/le-garff-yoann/docker-rpmbuilder-centos6/badges/master/pipeline.svg)](https://gitlab.com/le-garff-yoann/docker-rpmbuilder-centos6/pipelines)

It includes *rpmdevtools*'s tools.

## TL;DR

```bash
docker run --rm \
    -v /path/to/your/rpmbuild:/root/rpmbuild:Z \
    rpmbuilder-centos6 \
    /root/rpmbuild/SPECS/my-spec.spec
```
