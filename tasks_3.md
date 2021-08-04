# Rails models - console tasks

## Task 1: Creating the Critic model

1. We need to create the table and the model to manage critics in the app. Use generate model to complete this task. Use the toggle below to check attributes and types. Notice that this table has a reference to the Game model.
critics
  body: string
  game: Game
  created_at: timestamp
  updated_at: timestamp
```
rails generate model Game body:string game:references
rails db:migrate
```

## Task 2: Creating the User model

1. We need to create the table and the model to manage users in the app. Use generate model to complete this task.

```
rails generate model User username:string email:string birth_date:date first_name:string last_name:string
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
