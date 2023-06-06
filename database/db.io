Table users {
  id serial [pk]
  name varchar
  description text
  photo_id integer
  country_id integer
  city_id integer
}

Table posts {
  id serial [pk]
  user_id integer
  description text
  hashtags varchar
  likes integer
  views integer
}

Table comments {
  id serial [pk]
  post_id integer
  user_id integer
  text text
}

Table chats {
  id serial [pk]
  created_at timestamp
  owner_id integer
  type varchar [note: 'enum type']
}

Table messages {
  id serial [pk]
  chat_id integer
  user_id integer
  text text
  sent_at timestamp
}

Table media {
  id serial [pk]
  user_id integer
  media_type varchar [note: 'photo, audio, video']
  media_file varchar [note: 'URL to the object storage']
}

Table interests {
  id serial [pk]
  user_id integer
  interest varchar
}

Table countries {
  id serial [pk]
  country_name varchar
}

Table cities {
  id serial [pk]
  city_name varchar
  country_id integer
}

Table post_media {
  post_id integer
  media_id integer
  sort integer
}

Table comment_media {
  comment_id integer
  media_id integer
  sort integer
}

Table users_chats {
  user_id integer
  chat_id integer
  excluded boolean
  is_admin boolean
  added_at timestamp
  pinned boolean
}

Table messages_media {
  message_id integer
  media_id integer
  sort integer
}

Ref: users.photo_id > media.id
Ref: users.country_id > countries.id
Ref: users.city_id > cities.id

Ref: posts.user_id > users.id

Ref: comments.user_id > users.id
Ref: comments.post_id > posts.id

Ref: chats.owner_id > users.id

Ref: messages.chat_id > chats.id
Ref: messages.user_id > users.id

Ref: media.user_id > users.id

Ref: interests.user_id > users.id

Ref: cities.country_id > countries.id

Ref: post_media.post_id > posts.id
Ref: post_media.media_id > media.id

Ref: comment_media.comment_id > comments.id
Ref: comment_media.media_id > media.id

Ref: users_chats.user_id > users.id
Ref: users_chats.chat_id > chats.id

Ref: messages_media.message_id > messages.id
Ref: messages_media.media_id > media.id