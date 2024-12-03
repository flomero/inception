#!/bin/bash

env_file=$1

# Specify required environment variables
required_vars=(\
	DOMAIN \
	WP_DB_NAME \
	WP_DB_USER \
	#WP_DB_PASSWORD \
	WP_DB_HOST \
	WP_TITLE \
	WP_ADMIN_USER \
	#WP_ADMIN_PASSWORD \
	WP_ADMIN_EMAIL \
	WP_USER \
	WP_USER_EMAIL \
	#WP_USER_PASSWORD \
	FTP_USER \
	#FTP_PASS \
	)

red='\033[0;31m'
green='\033[0;32m'
nc='\033[0m'

# Load the .env file if it exists
if [ -f "$env_file" ]; then
  export $(grep -v '^#' $env_file | xargs)
else
  echo "Error: .env file not found!"
  exit 1
fi

# Check if required variables are set
for var in "${required_vars[@]}"; do
  if [ -z "${!var}" ]; then
    echo -e "${red}Error: $var is not set!${nc}"
    missing_var=true
  fi
done

# If any required variable is missing, exit with an error
if [ "$missing_var" = true ]; then
  exit 1
fi

# Check if WP_ADMIN contains restricted values
if [[ "$WP_ADMIN_USER" =~ (^|[-_])([Aa]dmin|[Aa]dministrator)([-_]|$) ]]; then
  echo -e "${red}Error: WP_ADMIN_USER cannot contain 'admin' or 'administrator'!${nc}"
  exit 1
fi

# If all checks pass
echo -e "${green}All environment variables are set correctly!${nc}"
echo -e "${green}Starting Docker Compose...${nc}"
exit 0