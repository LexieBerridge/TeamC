from application import db
from dataclasses import dataclass

@dataclass
class Recipe(db.Model):
    # the declarations below are important for turning the object into JSON
    recipe_id: int
    recipe_name: str
    recipe_description: str
    course: str
    cuisine: str
    prep_time: str
    cook_time: str
    collection: str

    recipe_id: db.Column(db.Integer, primary_key=True)
    recipe_name: db.Column(db.String(50))
    recipe_description: db.Column(db.String(200))
    course: db.Column(db.String(20), nullable=False)
    cuisine: db.Column(db.String(30), nullable=False)
    prep_time: db.Column(db.String(20), nullable=False)
    cook_time: db.Column(db.String(20), nullable=False)
    collection: db.Column(db.String(50), nullable=False)

    ingredient = db.relationship('Ingredient', backref='ingredient')
    quantity = db.relationship('Quantity', backref='quantity')
    recipe_step = db.relationship('RecipeStep', backref='recipe_step')
