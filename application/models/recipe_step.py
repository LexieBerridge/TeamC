from application import db
from dataclasses import dataclass

@dataclass
class RecipeStep(db.Model):
    # the declarations below are important for turning the object into JSON
    step_id: int
    step_description: str

    step_id = db.Column(db.Integer, primary_key=True)
    step_description = db.Column(db.String(400), nullable=False)
    recipe_id = db.Column(db.Integer, db.ForeignKey('recipe.recipe_id'), nullable=False)
    liked = db.relationship('Liked', backref='liked')

