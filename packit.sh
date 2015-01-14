#!/usr/bin/env bash

set -e

die () {
    echo >&2 "$@"
	echo "Usage: `basename $0` packer_file vagrant_box_name" 1>&2
    exit 1
}

[ "$#" -eq 2 ] || die "2 arguments required, $# provided"

[ -f $1 ] || die "packer file '$1' does not exist"

rm packer_virtualbox-iso_virtualbox.box 2> /dev/null || true
packer build $1
vagrant box add --force $2 packer_virtualbox-iso_virtualbox.box
