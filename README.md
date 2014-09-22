
Remixing Reddit with Rails
====================================
Site development utilizing conventional Rails magic. 

Live on Heroku @ http://kitten-newz.herokuapp.com/

Function: 
Site focuses on account creation and posting of user links and user comments. Also emphasizes require flash messages and error handling messages for user activity.

Includes some placeholder information for voting and comment counting and only minimal styling for secondary 'link' pages. Emphasis on initial page styling and layout using Foundation. 

Votes and comment counting/styling are TBD.

---

* Utilizes bundle gem to manage dependencies.
* Completed using ruby v2.0, rails 4.1.5
* Database utilized: PostgreSQL
* Utilizes rails helper and rspec 3.0 for TDD

---
Database schema: 

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "link_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "links", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "headline"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "link_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.integer  "vote_status"
  end