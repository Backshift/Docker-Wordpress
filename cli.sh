RED='\033[0;31m'
NC='\033[0m' # No Color
BGreen='\033[1;32m'

source ".env"

if [ -z "$1" ]; then
    printf """${BGreen}cli.sh                 
    ${RED}
Wordpress Docker
--------
Setup:
* certs => Create certs
* wp_install => install latest wordpress
* wp_config => updates wordpress configurations
    """
fi

if [ "$1" == "certs" ]; then
	bash scripts/create_certs.sh
elif [ "$1" == "wp_install" ]; then
	bash scripts/wordpress_install.sh
	bash scripts/wordpress_config.sh
elif [ "$1" == "wp_config" ]; then
	bash scripts/wordpress_config.sh
fi