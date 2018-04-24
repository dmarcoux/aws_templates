# <a href="https://github.com/dmarcoux/aws_templates">dmarcoux/aws_templates</a>

Amazon Web Services templates I use in various projects.

## Setup

*Note: Make sure Python is installed with `python -V`. Using the Python packages
ensure access to the latest version without depending on third-party packagers.
For the supported Python versions, refer to the packages.*

1. Install AWS Command Line Interface
   - `pip install awscli --upgrade --user`
2. Configure the AWS Command Line Interface
   ([Details](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html))
   - `aws configure`
3. Install AWS Elastic Beanstalk Command Line Interface
   - `pip install awsebcli --upgrade --user`
4. Install AWS Encryption SDK Command Line Interface
   - `pip install aws-encryption-sdk-cli --upgrade --user`

## Setup for AWS Lambda

1. Install Docker and Docker-Compose
   - Linux
       - openSUSE: `zypper install docker docker-compose`
       - Others: Look for packages `docker` and `docker-compose` (at
          https://pkgs.org/ if uncertain)
   - OS X
       1. [Install Homebrew](https://brew.sh/)
       2. `brew install docker docker-compose`
2. Install [NVM](https://github.com/creationix/nvm)
3. Install the NodeJS version referenced in [.nvmrc](.nvmrc)
   - `nvm install`
4. Install AWS SAM Local
   - `npm install -g aws-sam-local`
