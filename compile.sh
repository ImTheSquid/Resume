#!/bin/bash
set -e
typst compile two.typ JackHoganResume_TwoColumn.pdf
typst compile basic.typ JackHoganResume_OneColumn.pdf
