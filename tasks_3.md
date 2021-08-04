# Rails models - console tasks

## Task 1: Creating the Critic model

1. We need to create the table and the model to manage critics in the app. Use generate model to complete this task. Use the toggle below to check attributes and types. Notice that this table has a reference to the Game model.
critics
  body: string
  game: Game
  created_at: timestamp
  updated_at: timestamp
```
rails generate model Critic body:string game:references
rails db:migrate
```

## Task 2: Creating the User model

1. We need to create the table and the model to manage users in the app. Use generate model to complete this task.

```
rails generate model User username:string:uniq email:string:uniq birth_date:date first_name:string last_name:string
rails db:migrate
```

## Task 3: Update critics table

The recently created critics table needs some modifications. Using the migration generator:

1. Add the column title to the table.
```
rails generate migration AddTitleToCritic title:string
```
2. Add a reference to the users table.
```
rails generate migration AddUserRefToCritic user:references
```

## Task 4: Update the column type on the critics table

As you may notice, the column body on the critics table should be of type text (like a paragraph)
instead of a string (previously set).
Create a migration using rails generate migration ChangeBodyFromStringToTextOnCritics.
When you open the file created you will see:

1. Update the column type on the critics table.
```
rails generate migration ChangeBodyFromStringToTextOnCritics
```

## Task 5: Update the column type on the critics table

1. Rollback the last migration.
```
bin/rails db:rollback
```
== 20210804211357 ChangeBodyFromStringToTextOnCritics: reverting ==============
-- remove_column(:critics, :body, :text)
   -> 0.0370s
-- add_column(:critics, :body, :string)
   -> 0.0143s
== 20210804211357 ChangeBodyFromStringToTextOnCritics: reverted (0.0632s) =====

2. From that point, rollback the previous 3 migrations (using STEP)
```
bin/rails db:rollback STEP=3
```
== 20210804205621 AddUserRefToCritic: reverting ===============================
-- remove_reference(:critics, :user, {:null=>false, :foreign_key=>true})
   -> 0.0923s
== 20210804205621 AddUserRefToCritic: reverted (0.1035s) ======================

== 20210804205446 AddTitleToCritic: reverting =================================
-- remove_column(:critics, :title, :string)
   -> 0.0167s
== 20210804205446 AddTitleToCritic: reverted (0.0175s) ========================

== 20210804205342 CreateUsers: reverting ======================================
-- remove_index(:users, {:column=>:email})
   -> 0.0458s
-- remove_index(:users, {:column=>:username})
   -> 0.0196s
-- drop_table(:users)
   -> 0.0223s
== 20210804205342 CreateUsers: reverted (0.0920s) =============================

3. From that point, run up the migration until the last one we write on Task 3.
```
bin/rails db:migrate VERSION=20210804205621
```
== 20210804205342 CreateUsers: migrating ======================================
-- create_table(:users)
   -> 0.0719s
-- add_index(:users, :username, {:unique=>true})
   -> 0.0362s
-- add_index(:users, :email, {:unique=>true})
   -> 0.0253s
== 20210804205342 CreateUsers: migrated (0.1341s) =============================

== 20210804205446 AddTitleToCritic: migrating =================================
-- add_column(:critics, :title, :string)
   -> 0.0212s
== 20210804205446 AddTitleToCritic: migrated (0.0215s) ========================

== 20210804205621 AddUserRefToCritic: migrating ===============================
-- add_reference(:critics, :user, {:null=>false, :foreign_key=>true})
   -> 0.0826s
== 20210804205621 AddUserRefToCritic: migrated (0.0829s) ======================

At this moment, the critics table should have a column body with type string.
4. Run the remaining migrations.
```
bin/rails db:migrate
```
== 20210804211357 ChangeBodyFromStringToTextOnCritics: migrating ==============
-- remove_column(:critics, :body, :string)
   -> 0.0254s
-- add_column(:critics, :body, :text)
   -> 0.0130s
== 20210804211357 ChangeBodyFromStringToTextOnCritics: migrated (0.0391s) =====
