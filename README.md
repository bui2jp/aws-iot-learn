# aws-iot-learn

aws iot core
aws iot xxxx

## AWS IoT Core

概念を理解する。モノ、ルールエンジン、シャドウ。

AWS IoT Core とは Mqtt ブローカーです。１つの AWS アカウントに対して１つのデフォルトブローカーエンドポイントが提供されます。
異なるエンドポイントを設定する場合は、カスタムエンドポイントを設定する必要があります。

## ドメイン設定(endpoint)について

### AWS マネージドドメイン

AWS 管理のドメインを利用する場合は、以下のようなエンドポイントが提供されます。

```
xxxxxxxxxxxxxxxxxxx-ats.iot.ap-northeast-1.amazonaws.com
```

### 独自ドメイン設定

endpoint を変更する場合は、カスタムエンドポイントを設定する必要があります。

```bash
python3 aws-iot-device-sdk-python-v2/samples/pubsub.py --endpoint a3clczm6ayv88a-ats.iot.ap-northeast-1.amazonaws.com --ca_file root-CA.crt --cert my-thing-01.cert.pem --key my-thing-01.private.key --client_id basicPubSub --topic sdk/test/python --count 0
```

お名前.com で取得している独自ドメインも利用可能
Route53 でドメインを設定する
AWS Certificate Manager (ACM)：SSL/TLS 証明書の発行・管理サービスで証明書の発行
