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

# IoT 7 つのパターン

[aws blog](https://aws.amazon.com/jp/blogs/news/7-patterns-for-iot-data-ingestion-and-visualization-how-to-decide-what-works-best-for-your-use-case/)

| パターン | タイトル                                                                            | 説明 |
| -------- | ----------------------------------------------------------------------------------- | ---- |
| 1        | AWS IoT Greengrass ストリームマネージャー                                           |      |
| 2        | AWS IoT SiteWise (+ AWS IoT SiteWise Monitor)                                       |      |
| 3        | AWS IoT Core + AWS IoT Analytics + Amazon QuickSight                                |      |
| 4        | Amazon Timestream                                                                   |      |
| 5        | AWS IoT Core + Amazon Kinesis + Amazon QuickSight                                   |      |
| 6        | Amazon OpenSearch Service + OpenSearch Service Dashboards/Amazon Managed Grafana    |      |
| 7        | AWS IoT Core + AWS Lambda + Amazon DynamoDB + Amazon QuickSight / Custom Dashboards |      |

# IoT の始め方のベストプラクティス

小さく始める

本番導入を見据えた PoC 　セキュリティーなどを考慮した PoC

1. まずはリアルタイム可視化
2. データの保存
3. データの分析(予測・観測)
4. 通知

この順番
