# Rails models - console tasks

## Task 1: Creating the Game model

1. After updating the name of DB and creating the DB, using rails in the terminal generate your model and migrate it to create the table in DB

```
rails generate model Game name:string genre:string price:integer release_date:date​
rails db:migrate
```

Using your Rails console execute the right commands for each task:
​
## Task 2: Create Game records
​
1. Using the create method, create a Game with:
    name: Rune Factory 4 Special
    genre: Role-playing (RPG)
    price: 5999
    release_date: 2019-07-25
​
```
game01 = Game.create(name: "Rune Factory 4 Special", genre: "Role-playing (RPG)", price: 5999, release_date: "2019-07-25")
```
​
2. Using the new and save methods, create a Game with:
    name: Borderlands 3
    genre: Simulator
    price: 5999
    release_date: 2019-09-13
​
```
game02 = Game.new
game02.name = "Borderlands 3"
game02.genre = "Simulator"
game02.price = 5999
game02.release_date = "2019-09-13"
game02.save
```
​
3. Use this array of games to create the records on your database:
```
[ {:name=>"Zombie Driver: Immortal Edition", :genre=>"Racing", :price=>5999, :release_date=>"2019-Jul-25"},
{:name=>"Remnant: From the Ashes", :genre=>"Shooter", :price=>6999, :release_date=>"2019-Aug-20"},
{:name=>"Monster Hunter: World - Iceborne", :genre=>"Adventure", :price=>6999, :release_date=>"2019-Sep-06"},
{:name=>"Cyberpunk 2077", :genre=>"Role-playing (RPG)", :price=>4999, :release_date=>"2020-Sep-17"},
{:name=>"Pokémon Shield", :genre=>"Role-playing (RPG)", :price=>5999, :release_date=>"2019-Nov-15"},
{:name=>"Children of Morta", :genre=>"Role-playing (RPG)", :price=>6999, :release_date=>"2019-Sep-03"} ]
```
​
```
games = [ {:name=>"Zombie Driver: Immortal Edition", :genre=>"Racing", :price=>5999, :release_date=>"2019-Jul-25"},
{:name=>"Remnant: From the Ashes", :genre=>"Shooter", :price=>6999, :release_date=>"2019-Aug-20"},
{:name=>"Monster Hunter: World - Iceborne", :genre=>"Adventure", :price=>6999, :release_date=>"2019-Sep-06"},
{:name=>"Cyberpunk 2077", :genre=>"Role-playing (RPG)", :price=>4999, :release_date=>"2020-Sep-17"},
{:name=>"Pokémon Shield", :genre=>"Role-playing (RPG)", :price=>5999, :release_date=>"2019-Nov-15"},
{:name=>"Children of Morta", :genre=>"Role-playing (RPG)", :price=>6999, :release_date=>"2019-Sep-03"} ]

games.each { |game| Game.create(game) }
```
​
## Task 3: Accesing Game data
​
1. Get All the games.
​
```
Game.all
```
​
2. Find the game with id 4
​
```
Game.find(4)
```
​
3. Find the game that was released on "2019-Aug-20"
​
```
Game.find_by(release_date: "2019-Aug-20")
```
​
4. Get the first game
​
```
Game.first
```
​
5. Get the last game
​
```
Game.last
```
​
6. Get all the games sorted by release date (from newest to oldest)
​
```
Game.order(release_date: :desc)
```
​
7. Get all the games that cost $59.99 (5999 cents)
​
```
Game.where(price: 5999)
```
​
8. Get all the games released on 2019 (google-search "extract year on ActiveRecord" ��)
​
```
Game.where('extract(year from release_date) = ?', 2019)
```
​
## Task 4: Updating Game data
​
1. Find the game named "Borderlands 3" and saved it on a variable. Then, set their genre attribute to "Shooter". Finally, save the updated record.
​
```
borderland = Game.find_by(name: "Borderlands 3")
borderland.genre = "Shooter"
borderland.save
```
​
2. Find the game "Pokémon Shield" and use the method update to change it price to 3999.
​
```
pokemon = Game.find_by(name: "Pokémon Shield")
pokemon.update(price: 3999)
```
​
3. Update all the "Role-playing (RPG)" games to have a price of 2999. (first you need to select the games you want to update ��).
​
```
rpgs = Game.where(genre: "Role-playing (RPG)")
rpgs.update_all(price: 2999)
```
​
## Task 5: Deleting Game records
​
1. Find the record with id 3 and destroy it.
​
```
with_three = Game.find(3)
with_three.destroy
```
​
2. Destroy all the records of the genre "Adventure"
​
```
Game.destroy_by(genre: "Adventure")
```
​
3. Thinking again, destroy_all the games ��
​
```
Game.destroy_all
```
