RECENT_TAG = <<RECENTTAG
  SELECT * FROM posts
  JOIN post_tags ON posts.id = post_id
  JOIN tags ON tags.id = tag_id
  WHERE tags.id = ?
  ORDER BY posts.created_at DESC
  LIMIT 5

RECENTTAG

RECENT_USER = <<RECENTUSER


RECENTUSER


