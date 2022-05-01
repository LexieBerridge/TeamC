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

def show_recipe(id):
    recipe_table = session.query(Recipe).filter_by(recipe_id=id).first()
    recipe_dict = {'recipe_name': recipe_table.recipe_name, 'recipe_description': recipe_table.recipe_description}
    return recipe_dict

def search_recipe():
    search_results = []
    recipe_table = session.query(Recipe).all()
    user_search = input('search here for recipes: ')
    print(f"Here are the results that match your search: {user_search}")
    for row in recipe_table:
        if user_search in row.recipe_name or user_search in row.recipe_description:
            search_results.append(row.recipe_id)
            print(row.recipe_name)
            print(row.recipe_method)
            print(row.recipe_description)

# test code
show_recipe(1)
search_recipe()