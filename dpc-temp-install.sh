#!/bin/bash

# See README.md on dropping the line of code, below into your cli. It will not leave an installation file to delete.
# However, you can run this as a script and just delete the script file you created. **DO NOT** name this temp script as dpc.sh
sudo apt  install jq ; clear; printf '#!/bin/bash\n echo .\n echo .\n echo -----------------------------------------------------------------\n TOKEN=$(curl "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)\n curl -v -I -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest 2>&1 | grep -i RateLimit\n echo -----------------------------------------------------------------\n echo .\n echo .\n' >dpc.sh; chmod +x dpc.sh; ./dpc.sh; printf '*********************************************\n* From now on you can simply type: ./dpc.sh\n*********************************************\n'
