# 01-iot-core

## 環境毎（Dev,Stag,Prod など）に切り替える方法

トピックを分けるのが一般的

```
dt/<application>/<envname>/<context>/<thingname>

例えば dt/fa-app/prod/d1094
```

### 環境毎のトピック切り替え（デバイス側で切り替える）

AWS IoT Greengrass や AWS IoT Jobs によるデバイス設定の遠隔更新

### 環境毎のトピック切り替え（IoT Core 上で切り替える）

「Republish」アクション と get_dynamodb() の利用

DynamoDB に thing ごとの envname を保存しておき、IoT Core のルールエンジンでそれを取得してトピックを切り替える。

- DynamoDB のテーブル（例）

| thingname | envname |
| --------- | ------- |
| d1094     | prod    |
| d1095     | dev     |
| d1096     | dev     |
| :         | :       |

IoT Core のルールエンジンで以下のように設定する。

```
# SQL ステートメント
SELECT * FROM "dt/fa-app/incoming/#"

# アクション (Republish)
トピック: dt/fa-app/${get_dynamodb("TBL1", "thingname", ${topic(4)}, "GetItem権限がある IAM ロール").envname}/${topic(4)}
```

**_４つの注意点_**

- get_dynamodb() の実行に失敗した時
- Republish で指定できるトピックの最大文字数 (max 256 バイト)
- Republish に使用する IAM ロールのポリシー
- コスト 必ず２つの MQTT メッセージが発生。Basic Ingest の利用。 DynamoDB のコストもかかる。
