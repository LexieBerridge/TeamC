create database Foodstories;

use Foodstories; 

create table food_group (
	food_group_id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    group_name VARCHAR (20) NOT NULL,
    group_chart TINYBLOB,
    group_fact VARCHAR (500)
);

create table food_source (
	source_id int AUTO_INCREMENT PRIMARY KEY,
    source_image TINYBLOB,
    source_fact VARCHAR (10),
    source_season VARCHAR (10)
); 

create table nutrition (
	nutrition_id int AUTO_INCREMENT PRIMARY KEY,
    energy_kcal int,
    energy_kj int,
    fat VARCHAR (10),
    saturate VARCHAR (10),
    carbohydrate VARCHAR (10),
    sugar VARCHAR (10),
    starch VARCHAR (10),
    fibre VARCHAR (10),
    protein VARCHAR (10),
    salt VARCHAR (10)
);
create table user_table (
	user_id int AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR (20) NOT NULL,
    user_surname VARCHAR(30) NOT NULL,
    gender VARCHAR(20),
    user_age int
);

create table recipe (
	recipe_id int AUTO_INCREMENT PRIMARY KEY,
    recipe_name VARCHAR (50),
    recipe_description VARCHAR (200),
    course VARCHAR (20) NOT NULL,
    cuisine VARCHAR (30) NOT NULL,
    prep_time VARCHAR (20) NOT NULL,
    cook_time VARCHAR (20) NOT NULL,
    yield int NOT NULL
);
  ALTER TABLE recipe
  DROP COLUMN recipe_description;
 
 ALTER TABLE recipe
  ADD recipe_desription varchar(1500) NOT NULL
    AFTER recipe_name;

create table food_item (
	food_id int AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR (50) NOT NULL,
    ghg_emission VARCHAR (50) NOT NULL,
    land_use VARCHAR (50) NOT NULL,
    freshwater_withdraw VARCHAR (50) NOT NULL,
    food_group_id INT NOT NULL,
    FOREIGN KEY (food_group_id) REFERENCES food_group(food_group_id),
    source_id INT NOT NULL,
    FOREIGN KEY (source_id) REFERENCES food_source(source_id),
    nutrition_id INT NOT NULL,
    FOREIGN KEY (nutrition_id) REFERENCES nutrition(nutrition_id)
);



create table ingredient (
	ingredient_id int AUTO_INCREMENT PRIMARY KEY,
    food_id int,
    FOREIGN KEY (food_id) REFERENCES food_item(food_id),
    recipe_id int,
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
    category VARCHAR (50)
    );

-- dropped table quantity
-- create table quantity (
-- quantity_id int AUTO_INCREMENT PRIMARY KEY,
-- recipe_id int,
-- FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
-- ingredient_id int,
-- FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id),
-- quantity VARCHAR (10) NOT NULL,
-- measurement VARCHAR (10) NOT NULL
-- );

-- dropped table recipe_steps
-- create table recipe_step (
-- step_id int AUTO_INCREMENT PRIMARY KEY,
-- step_description VARCHAR (400) NOT NULL,
-- recipe_id int,
-- FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
-- );

create table liked (
    liked_id int AUTO_INCREMENT PRIMARY KEY,
	user_id int,
    FOREIGN KEY (user_id) REFERENCES user_table(user_id),
    recipe_id int,
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
);

create table collection (
	collection_id int AUTO_INCREMENT PRIMARY KEY,
    collection_name VARCHAR(50),
    collection_description VARCHAR (100)
    );
    
    
create table recipe_collection (
	recipe_collection_id int AUTO_INCREMENT PRIMARY KEY,
    collection_id int,
    FOREIGN KEY (collection_id) references collection(collection_id),
    recipe_id int,
    FOREIGN KEY (recipe_id) references recipe(recipe_id)
    );
