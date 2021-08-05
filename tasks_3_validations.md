# Rails migrations - console tasks

## Task 1: Add validations to the Game model

1. All the columns are required
2. The genre should be one of the following: Simulator, Adventure, Strategy, Role-playing (RPG), Shooter, Fighting, Sport.
3. The price should be a positive number.

## Task 2: Add validations to the Critic model

1. The title and body shouldn't be blank
2. The error message for a blank title or body should be: "can't be blank. Please write something!"

## Task 3: Add validations to the User model

1. The username and email should be present.
2. The username and email should be unique.
3. The username should have at least 6 characters.
4. The email should have an "email" format.
5. The birth_date cannot be more than 120 years ago or either be in the future. The messages should be "can't be more than 120 years ago" and "can't be in the future"
