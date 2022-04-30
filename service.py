from application import db


def add_new_user(user):
    db.session.add(user)
    db.session.commit()

# def show_recipe():
#     recipe = db.session.query(Recipe).filter_by(recipe_id=1).first()
#     recipe_name = recipe.recipe_name
#     recipe_description = recipe.recipe_description

