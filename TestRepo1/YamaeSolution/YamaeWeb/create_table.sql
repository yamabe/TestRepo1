/* ユーザーテーブル */
CREATE TABLE T量産指令 (
    発効日 DATETIME NOT NULL -- 発効日
  , 機種名 VARCHAR(100) NOT NULL -- 機種名
  , 指令No VARCHAR(100) NOT NULL -- 指令No
  , 部品コード VARCHAR(100) NOT NULL -- 部品コード
  , 指令部品 VARCHAR(1000) NOT NULL -- 指令部品
  , 台数当たりの使用数 INTEGER NOT NULL -- 台数当たりの使用数
  , 月間企画台数 INTEGER NOT NULL -- 月間企画台数
  , ステータス VARCHAR(100) -- ステータス
  , 試打検査予定日 DATETIME -- 試打検査予定日
  , 試打検査数量 INTEGER -- 試打検査数量
  , 試打検査注文日 DATETIME -- 試打検査注文日
  , 試打検査納品日 DATETIME -- 試打検査納品日
  , 試打検査確認日 DATETIME -- 試打検査確認日
  , 型費請求書提出日 DATETIME -- 型費請求書提出日
  , 試打組立用予定日 DATETIME -- 試打組立用予定日
  , 試打組立用数量 INTEGER -- 試打組立用数量
  , 試打組立用注文日 DATETIME -- 試打組立用注文日
  , 試打組立用納品日 DATETIME -- 試打組立用納品日
  , 試打組立予定日 DATETIME -- 試打組立予定日
  , 量試予定日 DATETIME -- 量試予定日
  , 量産開始予定日 DATETIME -- 量産開始予定日
  , 担当者 INTEGER -- 担当者
  , 削除フラグ VARCHAR(5) -- 削除フラグ
  , 作成ユーザー INTEGER -- 作成ユーザー
  , 最終更新ユーザー INTEGER -- 最終更新ユーザー
  , 作成日時 DATETIME NOT NULL -- 作成日時
  , 最終更新日時 DATETIME NOT NULL -- 最終更新日時
  , PRIMARY KEY (指令No)
);
/* ユーザーテーブル */
CREATE TABLE T単価 (
   単価ID INTEGER AUTO_INCREMENT NOT NULL -- 単価ID
  , 部品コード VARCHAR(100) -- 部品コード
  , 部品名称 VARCHAR(100) -- 部品名称
  , 材料ID INTEGER -- 材料ID
  , 材料名称 VARCHAR(100) -- 材料名称
  , 材質大分類 VARCHAR(100) -- 材質大分類
  , 材質 VARCHAR(100) -- 材質
  , 定尺寸法縦_original DOUBLE -- 定尺寸法縦
  , 定尺寸法横_original DOUBLE -- 定尺寸法横
  , 定尺仕入金額_original DOUBLE -- 定尺仕入金額
  , 定尺寸法縦 DOUBLE -- 定尺寸法縦
  , 定尺寸法横 DOUBLE -- 定尺寸法横
  , 厚み DOUBLE -- 厚み
  , 定尺仕入金額 DOUBLE -- 定尺仕入金額
  , 定尺仕入自動計算フラグ VARCHAR(5) -- 定尺仕入自動計算
  , 定尺売り金額 DOUBLE -- 定尺売り金額
  , 時間単価 DOUBLE -- 時間単価
  , 分単価 DOUBLE -- 分単価
  , 秒単価 DOUBLE -- 秒単価
  , m2あたりの材料費 DOUBLE -- 材料費
  , m2あたりの取数たて DOUBLE -- 取数たて
  , m2あたりの取数よこ DOUBLE -- 取数よこ
  , m2あたりの取数 DOUBLE -- 取数
  , 仕入れ単価 DOUBLE -- 仕入れ単価
  , 商品たて DOUBLE -- 商品たて
  , 商品よこ DOUBLE -- 商品よこ
  , たてしろ DOUBLE -- たてしろ
  , よこしろ DOUBLE -- よこしろ
  , 取り数 DOUBLE -- 取り数
  , 見積_材料費 DOUBLE -- 材料費
  , 見積_裁断 DOUBLE -- 裁断
  , 見積_打抜 DOUBLE -- 打抜
  , 見積_貼り DOUBLE -- 貼り
  , 見積_曲げ DOUBLE -- 曲げ
  , 見積_仕上げ DOUBLE -- 仕上げ
  , 見積_ロス管理 DOUBLE -- ロス管理
  , 見積_材料費比 DOUBLE -- 材料費比
  , 見積_加工費小計 DOUBLE -- 加工費小計
  , 見積_加工費比 DOUBLE -- 加工費比
  , 見積_単価 DOUBLE -- 単価
  , 見積_m2あたり材料費 DOUBLE -- m2あたり材料費
  , たて_しろあり DOUBLE -- 抜きたて
  , よこ_しろあり DOUBLE -- 抜きよこ
  , 縦取り数 DOUBLE -- 縦取り数
  , 横取り数 DOUBLE -- 横取り数
  , たて余 DOUBLE -- たて余
  , よこ余 DOUBLE -- よこ余
  , 計算_取り数 DOUBLE -- 取り数
  , 計算_材料費T DOUBLE -- 材料費T
  , 計算_材料費 DOUBLE -- 材料費
  , 計算_裁断 DOUBLE -- 裁断
  , 計算_打抜 DOUBLE -- 打抜
  , 計算_貼り DOUBLE -- 貼り
  , 計算_曲げ DOUBLE -- 曲げ
  , 計算_仕上げ DOUBLE -- 仕上げ
  , 計算_ロス管理 DOUBLE -- ロス管理
  , 計算_材料費比 DOUBLE -- 材料費比
  , 計算_加工費小計 DOUBLE -- 加工費小計
  , 計算_加工費比 DOUBLE -- 加工費比
  , 計算_単価 DOUBLE -- 単価
  , 定尺裁断_数 INTEGER -- 数
  , 定尺裁断_所要時間 INTEGER -- 所要時間
  , 定尺裁断_割数 INTEGER -- 割数
  , 寸法カット_数 INTEGER -- 数
  , 寸法カット_所要時間 INTEGER -- 所要時間
  , 寸法カット_割数 INTEGER -- 割数
  , 打抜_型取数 INTEGER -- 型取数
  , 打抜_プレス回数 INTEGER -- プレス回数
  , 曲げ_数 INTEGER -- 数
  , 曲げ_秒数 INTEGER -- 秒数
  , 曲げ_同時加工 INTEGER -- 同時加工
  , 仕上げ_数 INTEGER -- 数
  , 仕上げ_秒数 INTEGER -- 秒数
  , 仕上げ_同時加工 INTEGER -- 同時加工
  , ロス管理_材比 DOUBLE -- 材比
  , ロス管理_加工比 DOUBLE -- 加工比
  , 定尺裁断_時間 DOUBLE -- 時間
  , 定尺裁断_作業費 DOUBLE -- 作業費
  , 定尺裁断_単価当り DOUBLE -- 単価当り
  , 寸法カット_時間 DOUBLE -- 時間
  , 寸法カット_作業費 DOUBLE -- 作業費
  , 寸法カット_単価当り DOUBLE -- 単価当り
  , 打抜_時間当たりの加工数 DOUBLE -- 加工数/時間
  , 打抜_単価当り DOUBLE -- 単価当り
  , 曲げ_時間 DOUBLE -- 時間
  , 曲げ_作業費 DOUBLE -- 作業費
  , 曲げ_単価当り DOUBLE -- 単価当り
  , 仕上げ_時間 DOUBLE -- 時間
  , 仕上げ_作業費 DOUBLE -- 作業費
  , 仕上げ_単価当り DOUBLE -- 単価当り
  , ロス管理_材_費用 DOUBLE -- 材_費用
  , ロス管理_加工_費用 DOUBLE -- 加工_費用
  , 見積_定尺裁断費比 DOUBLE -- 見積_定尺裁断費比
  , 計算_定尺裁断費比 DOUBLE -- 計算_定尺裁断費比
  , 計算_寸法カット費比 DOUBLE -- 計算_寸法カット費比
  , 見積_打抜費比 DOUBLE -- 見積_打抜費比
  , 計算_打抜費比 DOUBLE -- 計算_打抜費比
  , 見積_貼り費比 DOUBLE -- 見積_貼り費比
  , 計算_貼り費比 DOUBLE -- 計算_貼り費比
  , 見積_曲げ費比 DOUBLE -- 見積_曲げ費比
  , 計算_曲げ費比 DOUBLE -- 計算_曲げ費比
  , 見積_仕上げ費比 DOUBLE -- 見積_仕上げ費比
  , 計算_仕上げ費比 DOUBLE -- 計算_仕上げ費比
  , 見積_ロス管理費比 DOUBLE -- 見積_ロス管理費比
  , 計算_ロス管理費比 DOUBLE -- 計算_ロス管理費比
  , ロット INTEGER -- ロット
  , 丸め数 INTEGER -- 丸め数
  , 商品重量 DOUBLE -- 商品重量
  , 図面ファイル VARCHAR(100) -- 図面ファイル
  , 備考 TEXT -- 備考
  , 削除フラグ VARCHAR(5) -- 削除フラグ
  , 作成ユーザー INTEGER -- 作成ユーザー
  , 最終更新ユーザー INTEGER -- 最終更新ユーザー
  , 作成日時 DATETIME NOT NULL -- 作成日時
  , 最終更新日時 DATETIME NOT NULL -- 最終更新日時
  , PRIMARY KEY (単価ID)
);
/* ユーザーテーブル */
CREATE TABLE M材料規格番号 (
    材料規格ID INTEGER AUTO_INCREMENT NOT NULL -- 材料規格ID
  , ステータス VARCHAR(100) -- ステータス
  , 得意先 INTEGER -- 得意先
  , 規格番号 VARCHAR(100) -- 規格番号
  , 材料名 VARCHAR(100) -- 材料名
  , No VARCHAR(100) -- No
  , 備考 TEXT -- 備考
  , 山恵フラグ VARCHAR(5) -- 山恵フラグ
  , 仕入れ先 INTEGER -- 仕入れ先
  , 材料メーカー INTEGER -- 材料メーカー
  , 材質 INTEGER -- 材質
  , M材料_材料ID INTEGER -- M材料_材料ID
  , 削除フラグ VARCHAR(5) -- 削除フラグ
  , 作成ユーザー INTEGER -- 作成ユーザー
  , 最終更新ユーザー INTEGER -- 最終更新ユーザー
  , 作成日時 DATETIME NOT NULL -- 作成日時
  , 最終更新日時 DATETIME NOT NULL -- 最終更新日時
  , PRIMARY KEY (材料規格ID)
);
/* ユーザーテーブル */
CREATE TABLE M材料価格 (
    材料ID INTEGER AUTO_INCREMENT NOT NULL -- 材料ID
  , 材料属性ID INTEGER -- 材料属性ID
  , 材料名称 VARCHAR(100) -- 材料名称
  , 材料メーカー INTEGER -- 材料メーカー
  , 材質大分類 VARCHAR(100) -- 材質大分類
  , 材質 VARCHAR(100) -- 材質
  , 定尺寸法縦 DOUBLE -- 定尺寸法縦
  , 定尺寸法横 DOUBLE -- 定尺寸法横
  , 厚み DOUBLE -- 厚み
  , 密度 DOUBLE -- 密度
  , 定尺仕入金額 DOUBLE -- 定尺仕入金額
  , m2あたり材料費 DOUBLE -- m2あたり材料費
  , 定尺売り金額 DOUBLE -- 定尺売り金額
  , 利益率 DOUBLE -- 利益率
  , 備考 TEXT -- 備考
  , 有効フラグ VARCHAR(5) -- 有効フラグ
  , 削除フラグ VARCHAR(5) -- 削除フラグ
  , 作成ユーザー INTEGER -- 作成ユーザー
  , 最終更新ユーザー INTEGER -- 最終更新ユーザー
  , 作成日時 DATETIME NOT NULL -- 作成日時
  , 最終更新日時 DATETIME NOT NULL -- 最終更新日時
  , PRIMARY KEY (材料ID)
);
/* ユーザーテーブル */
CREATE TABLE M材料属性 (
    材料属性ID INTEGER AUTO_INCREMENT NOT NULL -- 材料属性ID
  , 材料名称 VARCHAR(100) -- 材料名称
  , 材料メーカー INTEGER -- 材料メーカー
  , 材質大分類 VARCHAR(100) -- 材質大分類
  , 材質 VARCHAR(100) -- 材質
  , 耐寒 DOUBLE -- 耐寒
  , 耐熱 DOUBLE -- 耐熱
  , 難燃性 INTEGER -- 難燃性
  , 備考 TEXT -- 備考
  , 削除フラグ VARCHAR(5) -- 削除フラグ
  , 作成ユーザー INTEGER -- 作成ユーザー
  , 最終更新ユーザー INTEGER -- 最終更新ユーザー
  , 作成日時 DATETIME NOT NULL -- 作成日時
  , 最終更新日時 DATETIME NOT NULL -- 最終更新日時
  , PRIMARY KEY (材料属性ID)
);
/* ユーザーテーブル */
CREATE TABLE Mコード (
    コードID INTEGER AUTO_INCREMENT NOT NULL -- コードID
  , グループ VARCHAR(100) -- グループ
  , 名称 VARCHAR(100) -- 名称
  , 順序 INTEGER -- 順序
  , 備考 TEXT -- 備考
  , 削除フラグ VARCHAR(5) -- 削除フラグ
  , 作成ユーザー INTEGER -- 作成ユーザー
  , 最終更新ユーザー INTEGER -- 最終更新ユーザー
  , 作成日時 DATETIME NOT NULL -- 作成日時
  , 最終更新日時 DATETIME NOT NULL -- 最終更新日時
  , PRIMARY KEY (コードID)
);
/* ユーザーテーブル */
CREATE TABLE Mユーザー (
    ユーザーID INTEGER AUTO_INCREMENT NOT NULL -- ユーザーID
  , ユーザー名 VARCHAR(100) -- ユーザー名
  , パスワード VARCHAR(100) -- パスワード
  , ホスト名 VARCHAR(100) -- ホスト名
  , 備考 TEXT -- 備考
  , 削除フラグ VARCHAR(5) -- 削除フラグ
  , 作成ユーザー INTEGER -- 作成ユーザー
  , 最終更新ユーザー INTEGER -- 最終更新ユーザー
  , 作成日時 DATETIME NOT NULL -- 作成日時
  , 最終更新日時 DATETIME NOT NULL -- 最終更新日時
  , PRIMARY KEY (ユーザーID)
);
/* ユーザーテーブル */
CREATE TABLE M会社 (
    会社ID INTEGER AUTO_INCREMENT NOT NULL -- 会社ID
  , 会社名称 VARCHAR(100) -- 会社名称
  , 得意先 VARCHAR(5) -- 得意先
  , 仕入れ先 VARCHAR(5) -- 仕入れ先
  , 材料メーカー VARCHAR(5) -- 材料メーカー
  , 取引有無 VARCHAR(5) -- 取引有無
  , 備考 TEXT -- 備考
  , 削除フラグ VARCHAR(5) -- 削除フラグ
  , 作成ユーザー INTEGER -- 作成ユーザー
  , 最終更新ユーザー INTEGER -- 最終更新ユーザー
  , 作成日時 DATETIME NOT NULL -- 作成日時
  , 最終更新日時 DATETIME NOT NULL -- 最終更新日時
  , PRIMARY KEY (会社ID)
);