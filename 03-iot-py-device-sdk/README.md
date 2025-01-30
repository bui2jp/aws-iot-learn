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

python3 aws-iot-device-sdk-python-v2/samples/pubsub.py \
    --endpoint a3clczm6ayv88a-ats.iot.ap-northeast-1.amazonaws.com \
    --ca_file AmazonRootCA1.pem \
    --cert my-thing03.cert.pem \
    --key my-thing03.private.key \
    --client_id my-device3 \
    --topic iot/topic/2223 \
    --count 100
```

mqtt5

```bash
python3 aws-iot-device-sdk-python-v2/samples/mqtt5_pubsub.py \
    --endpoint a3clczm6ayv88a-ats.iot.ap-northeast-1.amazonaws.com \
    --ca_file AmazonRootCA1.pem \
    --cert my-thing03.cert.pem \
    --key my-thing03.private.key \
    --client_id my-device3mqtt5 \
    --topic iot/topic/mqtt5device \
    --count 100

```

Athena でデータを確認

```sql
SELECT * FROM "default"."my_iot_data3" WHERE message1 LIKE '%66%
```

pip install pyathena

```python
from pyathena import connect
import pandas as pd

# Athenaに接続
conn = connect(
    s3_staging_dir='s3://your-output-bucket/path/to/query/results/',
    region_name='ap-northeast-1'
)

# クエリを実行
query = 'SELECT * FROM "default"."my_iot_data3" WHERE message1 LIKE \'%66%\''
df = pd.read_sql(query, conn)

# 結果を表示
print(df)
```

## IoT Core にデバイスを登録
