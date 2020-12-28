# CI-ready Docker images

A collection of CI-ready Docker images with `apt update` already performed and
CI-related tools already preinstalled.



## Usage

In your GitHub workflow specification, perform the following changes:
- Change the image name of the container
- Remove all steps related to installation of build-related software
```diff
diff --git a/.github/workflows/build-qa-verify-make-targets-prefix.yml b/.github/workflows/build-qa-verify-make-targets-prefix.yml
index 44bef46..9b95c76 100644
--- a/.github/workflows/build-qa-verify-make-targets-prefix.yml
+++ b/.github/workflows/build-qa-verify-make-targets-prefix.yml
@@ -54,7 +54,7 @@ jobs:
 
 
     runs-on: ubuntu-latest
-    container: ubuntu:20.04
+    container: ciready/ubuntu:20.04-ci-c
 
 
 
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
initial metadata updates and CI-related package installations, wasting precious
time and bandwidth resources.

These always-updated images should provide an always-fresh base for your CI builds.
