#!/usr/bin/env bash
# Creates an .env from ENV variables for use with react-native-config
ENV_WHITELIST=${ENV_WHITELIST:-"^BASE_PROJECT"}
printf "Creating an .env file with the following whitelist:\n"
printf "%s\n\n" $ENV_WHITELIST
set | egrep -e $ENV_WHITELIST | egrep -v "^_" | egrep -v "WHITELIST" > .env
printf "\n.env created with contents:\n"
cat .env

# Run a fastlane lane to change app id and display name
gem update --system
bundle install
bundle exec fastlane prep_release_type