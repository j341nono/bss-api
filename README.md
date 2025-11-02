# CRUD を備えた掲示板の Backend

## Usage

Setup

```bash
./setup.sh
```

Run API

```bash
uv run manage.py runserver
```

## API 仕様

| Method     | EndPoint           | Description      |
| ---------- | ------------------ | ---------------- |
| **GET**    | `/api/posts/`      | 投稿一覧を取得   |
| **GET**    | `/api/posts/{id}/` | 特定の投稿を取得 |
| **POST**   | `/api/posts/`      | 新しい投稿を作成 |
| **PUT**    | `/api/posts/{id}/` | 投稿を更新       |
| **DELETE** | `/api/posts/{id}/` | 投稿を削除       |

## Model Architecture

### Post

| Filed      | Type          | Description      |
| ---------- | ------------- | ---------------- |
| id         | int           | 投稿 ID（自動）  |
| title      | CharField     | 投稿タイトル     |
| content    | TextField     | 投稿内容         |
| created_at | DateTimeField | 作成日時（自動） |

### コメント

| Filed      | Type             | Description         |
| ---------- | ---------------- | ------------------- |
| id         | int              | コメント ID（自動） |
| post       | ForeignKey(Post) | 対応する投稿        |
| name       | CharField        | コメント投稿者名    |
| text       | TextField        | コメント本文        |
| created_at | DateTimeField    | 作成日時（自動）    |

##　投稿の使用例

### POST

```json
POST /api/posts/
{
  "title": "はじめての投稿",
  "content": "Django REST Frameworkの練習です。"
}
```

### GET

```json
GET /api/posts/1/
{
  "id": 1,
  "title": "はじめての投稿",
  "content": "Django REST Frameworkの練習です。",
  "created_at": "2025-11-03T00:00:00Z",
  "comments": [
    {
      "id": 1,
      "post": 1,
      "name": "太郎",
      "text": "いいですね！",
      "created_at": "2025-11-03T01:00:00Z"
    }
  ]
}
```

## コメントの使用例

```json
POST /api/comments/
{
  "post": 1,
  "name": "花子",
  "text": "参考になりました！"
}

```
