#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset


# shellcheck disable=SC2154
public_source_ip="$(curl -s https://checkip.amazonaws.com)"

jq \
  --null-input \
  --arg public_source_ip "${public_source_ip}" \
  '
{
  public_source_ip: $public_source_ip
}
  ' \
  ;


