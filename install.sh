# This script retrieves all the required repos and installs them
# individually, the variables below dicate what version to install.
# by default, the versions below are the latest versions

# This variable is required to git clone all the required repos
GIT_API_KEY="<API KEY>"
GIT_ORGANIZATION_NAME="intellivoid"

COFFEEHOUSE_DLTC_VERSION="1.0.1" 
COFFEEHOUSE_NLPFR_VERSION="3.5"
COFFEEHOUSEMOD_APT_VERSION="1.0.0"
COFFEEHOUSEMOD_TOKENIZER_VERSION="1.0.0"
COFFEEHOUSEMOD_STOPWORDS_VERSION="1.0.0"
HYPER_INTERNAL_SERVICE_VERSION="1.0.0"
COFFEEHOUSE_SPAMDETECTION_VERSION="1.0.0"

echo " #### Downloading all git repos"
git clone https://${GIT_API_KEY}@github.com/${GIT_ORGANIZATION_NAME}/CoffeeHouse-DLTC.git
git clone https://${GIT_API_KEY}@github.com/${GIT_ORGANIZATION_NAME}/CoffeeHouse-NLPFR.git
git clone https://${GIT_API_KEY}@github.com/${GIT_ORGANIZATION_NAME}/CoffeeHouse-SpamDetection.git
git clone https://${GIT_API_KEY}@github.com/${GIT_ORGANIZATION_NAME}/CoffeeHouseMod-APT.git
git clone https://${GIT_API_KEY}@github.com/${GIT_ORGANIZATION_NAME}/CoffeeHouseMod-Tokenizer.git
git clone https://${GIT_API_KEY}@github.com/${GIT_ORGANIZATION_NAME}/CoffeeHouseMod-StopWords.git
git clone https://${GIT_API_KEY}@github.com/${GIT_ORGANIZATION_NAME}/Hyper-Internal-Service.git

echo " #### Installing NLPFR"
cd CoffeeHouse-NLPFR && git checkout ${COFFEEHOUSE_NLPFR_VERSION} && python3 setup.py install && cd ..
cd CoffeeHouseMod-APT && git checkout ${COFFEEHOUSEMOD_APT_VERSION} && python3 setup.py install && cd ..
cd CoffeeHouseMod-Tokenizer && git checkout ${COFFEEHOUSEMOD_TOKENIZER_VERSION} && python3 setup.py install && cd ..
cd CoffeeHouseMod-StopWords && git checkout ${COFFEEHOUSEMOD_STOPWORDS_VERSION} && python3 setup.py install && cd ..

echo " #### Installing DLTC"
cd CoffeeHouse-DLTC && git checkout ${COFFEEHOUSE_DLTC_VERSION} && python3 setup.py install && cd ..

echo " #### Installing Services"
cd Hyper-Internal-Service && git checkout ${HYPER_INTERNAL_SERVICE_VERSION} && python3 -m pip install -Ur dev_requirements.txt && python3 setup.py install && cd ..
cd CoffeeHouse-SpamDetection && git checkout ${COFFEEHOUSE_SPAMDETECTION_VERSION} && python3 setup.py install && cd ..

echo " #### Cleaning up"
rm -rf CoffeeHouse-NLPFR
rm -rf CoffeeHouseMod-APT
rm -rf CoffeeHouseMod-Tokenizer
rm -rf CoffeeHouseMod-StopWords
rm -rf CoffeeHouse-DLTC
rm -rf Hyper-Internal-Service
rm -rf CoffeeHouse-SpamDetection