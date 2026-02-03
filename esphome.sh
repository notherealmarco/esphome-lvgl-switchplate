#!/bin/bash

# Default device value
DEVICE=""

# Function to display usage
usage() {
  echo "Usage: $0 [-d <device>] <args>"
  echo "  -d <device>    Specify the device (default: no device)"
  echo "  <args>         Any additional arguments to pass to esphome"
  exit 1
}

# Parse command-line options
while getopts ":d:" opt; do
  case $opt in
  d)
    DEVICE="$OPTARG"
    ;;
  *)
    usage
    ;;
  esac
done

# Shift to remove parsed options
shift $((OPTIND - 1))

# Build the docker command
DOCKER_CMD="docker run --rm --privileged -v \"${PWD}\":/config -it"

# Add the device option if specified
if [ -n "$DEVICE" ]; then
    DOCKER_CMD="$DOCKER_CMD --device=$DEVICE"
fi

# Add the image and any additional arguments
DOCKER_CMD="$DOCKER_CMD ghcr.io/esphome/esphome $@"

# Run the command
eval $DOCKER_CMD