#/bin/bash

python3 aws-iot-device-sdk-python-v2/samples/mqtt5_pubsub.py \
    --endpoint a3clczm6ayv88a-ats.iot.ap-northeast-1.amazonaws.com \
    --ca_file AmazonRootCA1.pem \
    --cert my-thing03.cert.pem \
    --key my-thing03.private.key \
    --client_id my-device3mqtt5 \
    --topic iot/topic/mqtt5device \
    --count 1000
