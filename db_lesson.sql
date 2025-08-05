Q1
A, CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


Q2
A, ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;


Q3
A, INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, department_id)
VALUES
('高橋なおき', '1'),
('山本しょうた', '1'),
('佐藤けんた', '1'),
('伊藤ゆうま', '2'),
('中村 だいき', '2'),
('鈴木 あやか', '2'),
('渡辺 みさき', '2'),
('小林 ゆい', '3'),
('加藤 りお', '4'),
('斎藤 みく', '5');

INSERT INTO reports (person_id, content)
VALUES
('7', '本日は社内ミーティングに参加し、今後の開発方針について共有しました。'),
('8', '新規顧客向けの提案資料を作成し、営業チームに共有しました'),
('9', 'データベースのバックアップ作業を実施し、正常に保存されたことを確認しました。'),
('10', 'クライアントからの要望に基づき、既存機能の改修案をまとめました。'),
('11', '週次レポートを作成し、上長へ提出しました。内容確認済みです。'),
('12', 'バグ調査を行い、影響範囲を洗い出して関係者に報告しました。'),
('13', '午前中は問い合わせ対応、午後は仕様書の更新作業を行いました。'),
('14', '新メンバーへの業務引き継ぎを行い、マニュアルを補完しました。'),
('15', 'コードレビューを実施し、改善点をコメントとして残しました。'),
('16', '来月のプロジェクトスケジュールを見直し、工数の再計算を行いました。');


Q4
A, UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 4 WHERE person_id = 4;
UPDATE people SET department_id = 5 WHERE person_id = 6;


Q5 年齢の降順で男性の名前と年齢を取得してください。
A, SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;


Q6 テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明してください。
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

A, peopleテーブルから、カラムであるdepartment_idが1に値する、name、email、ageの
３つのレコードを、作成された日時の昇順(古い順)で取得する。


Q7 20代の女性と40代の男性の名前一覧を取得してください。
A, SELECT name FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2 OR age BETWEEN 40 AND 49 AND gender = 1;


Q8 営業部に所属する人だけを年齢の昇順で取得してください。
A, SELECT * FROM people WHERE department_id = 1 ORDER BY age;


Q9 開発部に所属している女性の平均年齢を取得してください。
A, SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2 GROUP BY gender;

Q10  名前と部署名とその人が提出した日報の内容を同時に取得してください。（日報を提出していない人は含めない）
A, SELECT p.name, d.name, r.content 
FROM people p
JOIN departments d 
USING (department_id )
JOIN reports r 
USING (person_id);


Q11  日報を一つも提出していない人の名前一覧を取得してください。
A, SELECT p.name 
FROM people p 
LEFT OUTER JOIN reports r 
USING (person_id)
WHERE r.content is NULL;