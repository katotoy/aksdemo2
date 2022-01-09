ECHO This will retrieve the service principal id and password

SET ACR_NAME=aksdemoacr1
SET SERVICE_PRINCIPAL_NAME=acr-sp-demo

az acr show --name %ACR_NAME% --query id --output tsv>temp.txt
set /p ACR_REGISTRY_ID=<temp.txt
ECHO %ACR_REGISTRY_ID%

az ad sp create-for-rbac --name %SERVICE_PRINCIPAL_NAME% --scopes %ACR_REGISTRY_ID% --role acrpull --query password --output tsv > temp.txt
set /p SP_PASSWD=<temp.txt

az ad sp list --display-name %SERVICE_PRINCIPAL_NAME% --query [].appId --output tsv > temp.txt
set /p SP_APP_ID=<temp.txt

SET DisplayA=Service principal ID: %SP_APP_ID%
SET DisplayB=Service principal password: %SP_PASSWD%

ECHO %SP_PASSWD%
ECHO %SP_APP_ID%
