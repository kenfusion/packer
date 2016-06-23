#!/bin/bash
set -e

packer push -name surefoot/centos6-64-min centos6-min-atlas.json
packer push -name surefoot/centos6-64-py centos6-py-atlas.json
