# 03-iot-device-sdk (python)

AWS IoT Device SDK for Python
https://docs.aws.amazon.com/ja_jp/iot/latest/developerguide/using-laptop-as-device.html

```
python --version
Python 3.13.1

python -m venv .venv
source .venv/bin/activate

# sdk のインストール
pip install awsiotsdk
```

```
git clone https://github.com/aws/aws-iot-device-sdk-python.git
```

git clone https://github.com/aws/aws-iot-device-sdk-python-v2.git

- `rm -rf .git` でリポジトリの履歴を削除しておく

### サンプルの実行

mqtt3

```sh
# エンドポイント、証明書、キーを指定して実行
# python pubsub.py --endpoint <endpoint> --cert <file> --key <file>

python3 aws-iot-device-sdk-python-v2/samples/pubsub.py --endpoint a3clczm6ayv88a-ats.iot.ap-northeast-1.amazonaws.com --ca_file AmazonRootCA1.pem --cert my-thing03.cert.pem --key my-thing03.private.key --client_id my-device3 --topic iot/topic/2222 --count 5
```

mqtt5

```sh
python3 aws-iot-device-sdk-python-v2/samples/mqtt5_pubsub.py --endpoint a3clczm6ayv88a-ats.iot.ap-northeast-1.amazonaws.com --ca_file AmazonRootCA1.pem --cert my-thing03.cert.pem --key my-thing03.private.key --client_id my-device3mqtt5 --topic iot/topic/mqtt5 --count 5
```

## IoT Core にデバイスを登録
