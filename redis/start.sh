#/bin/bash
docker run -itd --name=redis -p 6379:6379 --restart=always redis --requirepass "pojienimasiquanjia"
