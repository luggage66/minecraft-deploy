#!/bin/bash

cat <&0 > base.yaml

kustomize build . # && rm base.yaml