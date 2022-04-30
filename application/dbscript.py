from application import db



from application.models.food_group import FoodGroup
from application.models.food_source import FoodSource
from application.models.nutrition import Nutrition
from application.models.gender import Gender
from application.models.user_table import UserTable
from application.models.recipe import Recipe
from application.models.food_item import FoodItem
from application.models.ingredient import Ingredient
from application.models.liked import Liked
from application.models.collection import Collection
from application.models.recipe_collection import RecipeCollection

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql+pymysql://root:password@localhost/foodstories2504', echo=False)
Session = sessionmaker(bind=engine)
session = Session()

# def show_recipe(id):
#     recipe = session.query(Recipe).filter_by(recipe_id=id).first()
#     recipe_name = recipe.recipe_name
#     recipe_description = recipe.recipe_description

food = db.session.query(FoodGroup).filter_by(food_group_id=1).first()
print(food.group_name)


# recipe = session.query(Recipe).filter_by(recipe_id=1).first()
# print(recipe.recipe_name)

