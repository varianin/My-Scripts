#!/bin/bash

# Disable sleep, suspend, hibernate, and hybrid-sleep targets
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
