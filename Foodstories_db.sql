create database Foodstories;

use Foodstories; 

create table food_item (
	food_id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    food_name varchar (10) NOT NULL,
    food_group_id FOREIGN KEY REFERENCES food_group(food_group_id),
    food_source_id int FOREIGN KEY REFERENCES food_source(food_source_id),
    nutrition_id int FOREIGN KEY REFERENCES nutrition(nutrition_id),
    ghg_emission VARCHAR NOT NULL,
    land_use VARCHAR NOT NULL,
    freshwater_withdraw VARCHAR NOT NULL
);
    
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
    energy_kcal int (10),
    energy_kj int (10),
    fat VARCHAR (10),
    saturate VARCHAR (10),
    carbohydrate VARCHAR (10),
    sugar VARCHAR (10),
    starch VARCHAR (10),
    fibre VARCHAR (10),
    protein VARCHAR (10),
    salt VARCHAR (10)
);
    
create table ingredient (
	ingredient_id int AUTO_INCREMENT PRIMARY KEY,
    food_id int FOREIGN KEY REFERENCES food(food_id),
    recipe_id int FOREIGN KEY REFERENCES recipe(recipe_id),
    category VARCHAR
);
    
create table quantity (
	quantity_id int AUTO_INCREMENT PRIMARY KEY,
    recipe_id int FOREIGN KEY REFERENCES recipe(recipe_id),
    ingredient_id FOREIGN KEY REFERENCES ingredient(ingredient_id),
    quantity VARCHAR (10) NOT NULL,
    measurement VARCHAR (10) NOT NULL
);
    
create table recipe (
	recipe_id int AUTO_INCREMENT PRIMARY KEY,
    recipe_name VARCHAR (50),
    recipe_description VARCHAR (200),
    course VARCHAR (20) NOT NULL,
    cuisine VARCHAR (20) NOT NULL,
    prep_time VARCHAR (20) NOT NULL,
    cook_time VARCHAR (20) NOT NULL,
    collection VARCHAR (20) NOT NULL
);
    
create table recipe_steps (
	step_id int AUTO_INCREMENT PRIMARY KEY,
    step_description VARCHAR (400) NOT NULL,
    recipe_id int FOREIGN KEY REFERENCES recipe(recipe_id)
);
    
create table likes (
	user_id int FOREIGN KEY REFERENCES user_table(user_id),
    recipe_id int FOREIGN KEY REFERENCES recipe(recipe_id)
);
    
create table user_table (
	user_id int AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR (10) NOT NULL,
    user_age int
);
	
