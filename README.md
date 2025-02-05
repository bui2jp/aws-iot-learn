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

# セキュリティ 証明書

- デバイスの作成
- 証明書の作成とデバイスにアタッチ
- ポリシーを作成して証明書にアタッチ

AWS 管理のサーバー認証用 CA 証明書は[こちら](https://docs.aws.amazon.com/ja_jp/iot/latest/developerguide/server-authentication.html?icmpid=docs_iot_console#server-authentication-certs)で入手可能。

# IoT の始め方のベストプラクティス

小さく始める

本番導入を見据えた PoC 　セキュリティーなどを考慮した PoC

1. まずはリアルタイム可視化
2. データの保存
3. データの分析(予測・観測)
4. 通知

この順番

# QoS レベル

- AWS IoT Core 2025/01 時点では QoS2 はサポートされていない。
- pub/sub で 異なる QoS レベルを指定した場合は低い方の QoS レベルになる。

| QoS レベル | 送信回数                                                                                  | 説明                                                                                                                       | まとめ                       |
| ---------- | ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| 0          | At most once<br>0 回以上                                                                  | このレベルは、信頼できる通信リンクを介して送信されるメッセージや、見逃しても問題がないメッセージに使用する必要があります。 | 高速<br>低負荷               |
| 1          | At least once<br>少なくとも 1 回送信され、PUBACK 応答が受信されるまで繰り返し送信されます | 送信者が正常に配信されたことを示す PUBACK 応答を受信するまで、メッセージは完了したとはみなされません。                     | 中程度の速度・負荷<br>高信頼 |
| 2          | Exactly once <br>(正確に 1 回)                                                            | 送信者と受信者の間で複数回の確認応答が行われます。                                                                         | 低速・高負荷<br>最高信頼     |

# Kinesis Data Stream 料金

- オンデマンド
  　 1 ストリームあたり、USD 0.052/hour の料金が発生する tokyo リージョンだとおよそ 35 ～ 40USD くらいか。

- プロビジョンド
