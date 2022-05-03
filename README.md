# CI-ready Docker images

A collection of frequently updated CI-ready Docker images with package metadata already downloaded and
CI-related tools already preinstalled.



## Docker Hub Repositories

The following [Docker Hub](https://hub.docker.com/) repositories host these CI-ready images:
- https://hub.docker.com/repository/docker/ciready/centos
- https://hub.docker.com/repository/docker/ciready/debian
- https://hub.docker.com/repository/docker/ciready/opensuse
- https://hub.docker.com/repository/docker/ciready/ubuntu



## Language-specific tags

Docker image tags generated by this repository contain a suffix indicating
the target programming language the image is prepared for.

The following target language suffixes are provided:
- `-ci-c`



## Usage

In your CI job specification (i.e. GitHub workflow), perform the following changes:
- Change the image repository and tag of the container
- Remove all commong build software intallation steps (things like make, gcc, libtool etc.)

Example:
```diff
diff --git a/.github/workflows/build-qa-verify-make-targets-prefix.yml b/.github/workflows/build-qa-verify-make-targets-prefix.yml
index 44bef46..9b95c76 100644
--- a/.github/workflows/build-qa-verify-make-targets-prefix.yml
+++ b/.github/workflows/build-qa-verify-make-targets-prefix.yml
@@ -54,7 +54,7 @@ jobs:
 
 
     runs-on: ubuntu-latest
-    container: ubuntu:22.04
+    container: ciready/ubuntu:22.04-ci-c
 
 
 
@@ -65,10 +65,6 @@ jobs:
 
 
 
-      - run: |
-          DEBIAN_FRONTEND=noninteractive apt-get update -y
-          DEBIAN_FRONTEND=noninteractive apt-get install -y git build-essential [...]
-
       - uses: actions/checkout@v2
       - run: ./configure
       - run: make
```



## Motivation

In CI systems, every invocation of Docker-based run consumes time by performing
the initial package metadata updates and CI-related package installations,
wasting precious time and bandwidth resources.

Implementing these images in [Snoopy](https://github.com/a2o/snoopy/)'s CI
resulted in a 15-20% CI job run time reduction across the board, and around
75% job run time reduction for OpenSUSE-related jobs.
