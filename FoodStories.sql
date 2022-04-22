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
    user_age int,
    username varchar(20) not null unique,
    password varbinary(100) default null
);

create table recipe (
	recipe_id int AUTO_INCREMENT PRIMARY KEY,
    recipe_name VARCHAR (50),
    recipe_description VARCHAR (200),
    reipe_method varchar(1500) not null,
    ingredient_quantity varchar(1000) not null,
    course VARCHAR (20) NOT NULL,
    cuisine VARCHAR (30) NOT NULL,
    prep_time VARCHAR (20) NOT NULL,
    cook_time VARCHAR (20) NOT NULL,
    yield int NOT NULL
);
select * from recipe;


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

insert into recipe
values(1, "Spaghetti Bolognese", 'Minced beef with tomato sauce and spaghetti pasta', "Heat a large saucepan over a medium heat. Add a tablespoon of olive oil and once hot add the beef mince and a pinch of salt and pepper. Cook the mince until well browned over a medium-high heat (be careful not to burn the mince. It just needs to be a dark brown colour). Once browned, transfer the mince to a bowl and set aside.

Add another tablespoon of oil to the saucepan you browned the mince in and turn the heat to medium. Add the onions and a pinch of salt and fry gently for 5-6 minutes, or until softened and translucent. Add the garlic and cook for another 2 minutes. Add the grated carrot then pour the mince and any juices in the bowl back into the saucepan.

Add the tomatoes to the pan and stir well to mix. Pour in the stock, bring to a simmer and then reduce the temperature to simmer gently for 45 minutes, or until the sauce is thick and rich. Taste and adjust the seasoning as necessary.

When ready to cook the spaghetti, heat a large saucepan of water and add a pinch of salt. Cook according to the packet instructions. Once the spaghetti is cooked through, drain and add to the pan with the bolognese sauce. Mix well and serve.", "2 tbsp olive oil, 400g/14oz beef mince, 1 onion, diced, 2 garlic cloves, chopped, 100g/3½oz carrot, grated, 2 x 400g tin chopped tomatoes, 400ml/14fl oz stock made from stock cube. Ideally beef, but any will do, 400g/14oz dried spaghetti, salt and pepper", 'Dinner', "Italian", 30, 45, 4),
	  
	 (2, "Chicken Thai Green Curry", "Chicken with vegetables in a mild/spicy sauce, served with rice", "Heat the oil in a wok over a high heat until smoking. Add the green curry paste and stir fry for 1–2 minutes, or until fragrant.

Add the chicken strips and stir until coated in the curry paste. Continue to stir-fry for 1–2 minutes, or until the chicken has browned on all sides.

Add the coconut milk, lime leaves, fish sauce and sugar and stir well. Bring the mixture to the boil, then reduce the heat until the mixture is simmering. Continue to simmer for 8–10 minutes, or until the sauce has thickened.

Add the green beans and asparagus and continue to simmer for 2–3 minutes, stirring regularly, until just tender. Season with salt and pepper.

To serve, spoon the rice into four serving bowls, then ladle over the Thai green chicken curry. Sprinkle over the coriander leaves.", "1 tbsp vegetable oil, 2 tbsp ready-made Thai green curry paste, 6 chicken thighs, skin and bones removed, meat cut into strips, 400ml tin coconut milk, 2 lime leaves (optional), 2 tbsp Thai fish sauce, 1 tbsp caster sugar, handful green beans, trimmed, handful asparagus spears, salt and freshly ground black pepper, Thai fragrant rice, cooked according to packet instructions, handful fresh coriander leaves (optional)", "Dinner", "Thai", 30, 20, 4),
	  (3, "Cottage Pie", "Cooked minced meat and vegetables in a gravy with mashed potato on top", "Heat half of the oil in a large heavy-based pan. Add the onion and cook until softened. Tip it onto a plate.

Return the pan to the heat and add the remaining oil. When it's hot, fry the mince, in batches if needed, for 4–5 minutes, or until browned all over. Stir in the cooked onion and tomato purée and cook for 1 minute. Stir in the flour and cook for a further minute. Pour in the red wine, scraping up any caramelised bits with a wooden spoon, and add the thyme.

Add the stock and simmer for 45 minutes, or until the mince is tender and the mixture has thickened. Season to taste, and add a few dashes of Worcestershire sauce. Keep warm over a very low heat. Preheat the grill to high.

Meanwhile, for the mash, put the potatoes in a pan of salted water and bring to the boil. Reduce the heat and simmer for 12–15 minutes, or until they are tender. Drain and return the potatoes to the pan, then place over the heat for about 1 minute to drive off any excess moisture. Mash well, then add the butter and milk, beating to form a smooth mash. Season to taste.

Put the cottage pie filling in a baking dish and spoon the mash over the top. Grill for 8–10 minutes, or until golden-brown.

Meanwhile, boil the peas in boiling water in a small saucepan for 3–4 minutes, then drain and add the butter. Serve the cottage pie with the peas.","50ml/2fl oz olive oil, 1 large onion or 3–4 banana shallots, finely chopped, 650g/1lb 7oz beef mince, 2 tbsp tomato purée, 1 tbsp plain flour, 150ml/5fl oz red wine, 4 sprigs fresh thyme, leaves only, 400ml/14fl oz beef stock, Worcestershire sauce, salt and freshly ground black pepper, 900g/2lb King Edward potatoes, peeled and chopped, 115g/4oz butter, 125ml/4½fl oz milk, 150g/5½oz frozen peas, 50g/1¾oz butter", "Dinner", "British", 30, 120, 6),
      (4, "Breakfast Wrap", "Wraps filled with breakfast items, can be made into a vegetarian version", "Heat a non-stick frying pan and add the peppers and mushrooms, fry for a few minutes until softened, then add the spinach and paprika. (If your pan tends to stick you will need to use a little oil or cooking spray.)

Crack in the eggs and cook to allow the eggs scramble with the vegetables all in the one pan. Add plenty of black pepper and the parsley.

Place the tortilla on a microwave-safe plate and heat on high for 10 seconds.

To serve, spoon the egg and vegetable mixture onto the tortilla, fold up one end, then fold in the sides.", "45g/1½oz pepper (about half a pepper), sliced, 2 mushrooms, sliced, 80g/2¾oz spinach, pinch ground paprika, 2 free-range eggs, freshly ground black pepper, 1 tsp freshly chopped parsley, 1 tortilla wrap", "Breakfast", "British", 30, 10, 1),
      (5, "Rhubarb Crumble", "A butter and flour crumble served on top of stewed rhubarb", "Preheat the oven to 180C/160C Fan/Gas 4.

Cut the rhubarb into 7½cm/3in long sticks and place on an oven tray. Sprinkle with 4 tablespoons of water and the caster sugar. Roast for 10 minutes. Sprinkle over the ginger and mix well.

Fill an ovenproof dish about 4cm/1½in deep with the rhubarb.

Rub the butter into the flour then mix in the demerara sugar to make the crumble topping. Sprinkle over the rhubarb and bake for 35–45 minutes, or until the crumble topping is crisp and golden-brown and the rhubarb filling has softened and is bubbling.

Allow to cool slightly before serving with double cream.", "10 sticks of rhubarb, 8 tbsp caster sugar, 1 tsp ground ginger, 110g/4oz butter, softened, 110g/4oz demerara sugar, 200g/7oz plain flour, double cream", "Dessert", "British", 25, 45, 4),
      (6, "Spicy Tofu Fajitas", "Chilli spiced vegeatbles and tofu fried together and served in wraps", "Preheat the oven to 180C/160C Fan/Gas 4. Wrap the tortillas in kitchen foil and place in the oven to warm.

Cut the tofu into triangles, each around 5mm thick. Sprinkle the cornflour over a plate and roll the tofu in the cornflour, a piece at a time, then place on a clean plate.

Heat the oil in a frying pan over a medium heat. Add the tofu pieces and fry for 3–4 minutes, turning once or twice, until golden brown and crisp. Drain on a plate lined with kitchen paper.

Add the peppers and onion to the pan and stir-fry for 3 minutes. Stir in the spices and cook for a few seconds more, then add the kale and tomatoes. Season with a little salt and lots of black pepper. Cook for 2 minutes, or until the tomatoes are soft. Add in the tofu and gently heat through.

Pile into warmed tortillas and serve with the yoghurt, coriander and a squeeze of lime juice.", "4 small wholemeal tortillas, 200g/7oz very firm tofu, drained, 2 tbsp cornflour or easy-cook polenta, 2 tbsp extra virgin olive oil or cold pressed rapeseed oil, 2 peppers, deseeded and thinly sliced, ½ red onion, cut into thin wedges, 1 tsp smoked paprika, ½ tsp ground cumin, ½ tsp ground coriander, 50g/1¾oz curly kale, thickly shredded and any tough stalks removed, 2 tomatoes, roughly chopped, salt and freshly ground black pepper, 4 tbsp non-dairy yoghurt, fresh coriander, lime wedge", "Lunch", "Mexican", 30, 10, 2),
      (7, "Sausage and Lentil Stew", "Meaty sausages and lentils are combined in a thick sauce", "Heat one tablespoon of the oil in a large, deep frying pan or shallow casserole and fry the sausages over a medium heat for 6–8 minutes, or until lightly browned on all sides. Transfer to a plate and return the pan to the heat.

Add the remaining oil and onion and gently fry for 4–5 minutes, or until softened and lightly browned, stirring regularly. Add the tomatoes and lentils, crumble over the stock cube and add the red wine (or the equivalent extra stock). Add 500ml/18fl oz of water to the pan.

Cover loosely with a lid and bring to a gentle simmer. Cook for 15 minutes, stirring occasionally. Return the sausages to the pan and cook for 10–15 minutes, or until the lentils are tender and the sausages cooked, stirring regularly. Add a little extra water if needed.

Serve with lots of freshly cooked green leafy vegetables, or warmed, crusty bread.", "2 tbsp olive oil, 400g/14oz sausages, ideally spicy sausages such as Toulouse or Spanish-style pork, 1 onion, thinly sliced, 400g chopped tomatoes with herbs, 160g/5¾oz Puy lentils, 1 chicken or pork stock cube, 75ml/2½fl oz oz red wine, or extra stock", "Dinner", "French", 20, 45, 4),
      (8, "Chicken and Chorizo Paella", "Paella rice with chicken and chorizo fried together in a pan", "Preheat the oven to 180C/160C Fan/Gas 4.

Heat the oil in a large, lidded, heatproof pan or paella pan. Fry the chicken until the pieces are evenly browned, turning them regularly as they cook. You may need to do this in two batches, depending on the size of your pan. Remove the chicken from the pan and set aside.

Fry the slices of chorizo in the pan until crisp. They will release their juices into the pan, which adds a lot of flavour to the dish. Add the onion to the pan, and cook gently until soft, then add the garlic and fry for a further 2–3 minutes. Add the red peppers, chillies and smoked paprika, cook for another 2–3 minutes. Return the chicken pieces to the pan and pour in the stock. Simmer gently for 20–25 minutes until the chicken is tender.

Add the rice to the pan, cover with the lid and put into the preheated oven. Cook for 30 minutes, or until all the liquid has been absorbed and the rice is cooked. Alternatively, if using a paella pan which won’t fit in the oven, cover tightly with foil and continue cooking on the stove over a low heat for the same cooking time. If using mussels or clams, add them to the pan for the final 20 minutes cooking time. Discard any shells that remain closed after cooking. Check the chicken is cooked by piercing the thickest part of a piece with a skewer – if the juices run clear the chicken is cooked.

Sprinkle with parsley before bringing the pan to the table. Let your guests help themselves.", "1–2 tbsp oil, 12 whole chicken pieces (legs or thighs), on the bone, 1 chorizo sausage, sliced into 3mm/⅛in thick slices, 1 large onion, finely chopped, 3 garlic cloves, crushed, 2 red peppers, seeds removed, sliced, 2–3 red chillies, seeds removed, chopped, 2 tsp smoked paprika, 1.5 litres/2½ pints chicken stock, 400g/14oz paella rice, 12 mussels or clams, (optional) cleaned, open and damaged shells discarded, handful parsley, roughly chopped", "Dinner", "Spanish", 30, 120, 6),
      (9, "Breakfast Quesadillas", "Refried beans, tomatoes and meat sprinkled with cheddar cheese and served toasted in a wrap", "First make the salsas. For the tomato salsa, put the tomatoes in a bowl. Mix in the onion and jalapeños. Add the honey, lime juice, cayenne pepper, salt and pepper and mix well. Add the coriander and set aside for 30 minutes. Make the mango salsa in the same way, in a separate bowl.

Preheat the oven to 180C/160C Fan/Gas 4. Lightly grease a large baking sheet.

Heat a frying pan over a high heat and add a knob of butter. Cook the bacon for a few minutes until crisp. Remove from the heat and leave to cool a little.

Whisk the eggs together with salt and pepper and a splash of milk. Melt a large knob of butter in a non-stick saucepan. Add the eggs and cook over a low heat, stirring until the eggs are softly scrambled. Remove from the heat.

To assemble, melt a little more butter. Lay the tortillas on a board and lightly brush with the melted butter. Place a quarter of the bacon on one half of each tortilla. Top with the scrambled egg, and a couple of tablespoons of tomato salsa. Sprinkle on some chopped red onion, grated cheese and a little chopped coriander; don’t overfill.

Fold over the tortilla to make a semicircle shape, brush the top with more melted butter and sprinkle over a pinch of cayenne pepper. Cut each tortilla in half and carefully place on the baking sheet.

Bake for 10 minutes. Leave to cool slightly and serve with the mango salsa, soured cream, guacamole, refried beans and any remaining tomato salsa.","unsalted butter, for cooking, 6 rashers unsmoked bacon, chopped, 6 large free-range eggs, splash milk, 4 flour tortillas, ½ small red onion, finely chopped, 4 tbsp cheddar or Monterey Jack cheese, grated, small handful chopped fresh coriander, cayenne pepper, 150g/5½oz small cherry tomatoes, chopped, ½ red onion, finely chopped, 1–2 tsp finely chopped hot green jalapeño chillies (from a jar), 1 tbsp honey, 1 lime, juice only, pinch cayenne peppe, ¼ tsp salt pinch freshly ground black pepper, 4 tbsp chopped fresh coriander, 1 ripe mango, peeled, stone removed, finely chopped, ½ red onion, finely chopped, 1–2 tsp finely chopped hot green jalapeño chillies (from a jar), 1 lime, juice only, pinch cayenne pepper, ¼ tsp salt pinch freshly ground black pepper, 4 tbsp chopped fresh coriander, 4 tbsp soured cream, guacamole, refried beans", "Breakfast", "Mexican", 40, 25, 4),
      (10, "Healthy Tuna Pasta Salad", "Healthy salad vegetables served with tinned tuna ", "Place the cooked penne into a large bowl with all the other ingredients (the residual heat from the pasta will heat the other ingredients to give you a warm pasta dish).

Place the grated carrot, cucumber and chopped tomatoes into a separate bowl and mix together.

Serve both bowls of salad together at the table, warm, or refrigerate and mix together for a packed lunch salad.","150g/5oz whole wheat pasta, cooked according to packet instructions (to al dente) and drained, 150g/5oz olives, chopped, 150g/5oz canned tuna, drained, 75g/2½oz Parmesan, grated, 2 tbsp olive oil, 3 tbsp chopped fresh flatleaf parsley, 3 carrots, grated or sliced into ribbons using a vegetable peeler, 1 cucumber, seeds removed and grated or sliced into ribbons using a vegetable peeler, 2 tomatoes, chopped", "Lunch", "British", 30, 10, 5);


INSERT INTO collection
values(1, "Easy Meals", "Easy meals to make recipes"),
	  (2, "Vegan", "Meals and snacks suitable for vegans"),
	  (3, "Winter Warmers", "Hearty meals ideal for the cold weather"),
	  (4, "Brunch", "Filling meals suitable to eat bewteen breakfast and lunch"),
	  (5, "Seasonal", "Recipes using ingredients that are available seasonally"),
	  (6, "Vegetarian", "Recipes suitable for vegetarians"),
	  (7, "Curries", "All things curry"),
	  (8, "Dinner Party", "Showstopping recipes for dinner parties or to impress your friends and family"),
	  (9, "Baby Food", "Recipes for babies and toddlers"),
	  (10, "Healthy", "Healthy recipes for the whole family");

select * from collection;

INSERT INTO recipe_collection
values(1, 1, 1),
	  (2, 2, 7),
	  (3, 3, 3),
	  (4, 4, 1),
	  (5, 5, 5),
	  (6, 6, 6),
	  (7, 7, 3),
	  (8, 8, 8),
	  (9, 9, 4),
	  (10, 10, 10);

select * from recipe_collection;
select * from user_table;


INSERT INTO user_table (user_id, user_name, user_surname, gender, user_age, username, password)
values(1, "Winston", "Churchill", "Male", 78, "Win1", aes_encrypt('church789', 'key1234')),
	  (2, "Justin", "Timberlake", "Male", 41, "JB", aes_encrypt('password895', 'key1234')),
	  (3, "David", "Beckham", "Male", 43, "GoldenBalls", aes_encrypt('Balls5', 'key1234')),
	  (4, "Elvis", "Presley", "Male", 61, "Vegas", aes_encrypt('shookup73', 'key1234')),
	  (5, "Elizabeth", "Hurley", "Female", 57, "Hurls", aes_encrypt('Granty', 'key1234')),
	  (6, "Martha", "Stewart", "Female", 18, "MSTEW", aes_encrypt('Food4587', 'key1234')),
	  (7, "Judi", "Dench", "Female", 82, "Jench", aes_encrypt('password3625', 'key1234')),
	  (8, "James", "Nesbitt", "Male", 17, "Jbitt", aes_encrypt('Nessy1', 'key1234')),
	  (9, "Sam", "Smith", "Prefer not to say", 25, "Smithy", aes_encrypt('password7841', 'key1234')),
	  (10, "Nigella", "Lawson", "Female", 29, "Ellaw", aes_encrypt('Cookery789', 'key1234'));
      
 select user_id, username, cast(aes_decrypt(password, 'key1234') as char(100)) from user_table;
 
 select * from recipe;
 
 INSERT INTO food_group (food_group_id, group_name, group_fact)
 values(1, "Starchy Carbs", "Carbs give us energy and the slow release carbs are best"),
	   (2, "Fruit", "Contains vitamins and minerals, an apple a day keeps the doctor away"),
       (3, "Dairy", "Contains calcium for healthy teeth and stong bones"),
       (4, "Protein", "Helps muscles to grow and repair, perfect for people who are doing lots of exercise"),
       (5, "Fats", "Fat helps keep our organs safe but too much of it can be bad for your health"),
       (6, "Vegetables", "Keep us healthy, make sure you have your five a day");
    

select * from food_group;