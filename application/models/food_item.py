from application import db
from dataclasses import dataclass


@dataclass
class FoodItem(db.Model):
    # the declarations below are important for turning the object into JSON
    food_id: int
    food_name: str
    ghg_emission: str
    land_use: str
    freshwater_withdraw: str

    food_id: db.Column(db.Integer, primary_key=True)
    food_name: db.Column(db.String(50), nullable=False)
    ghg_emission: db.Column(db.String(50), nullable=False)
    land_use: db.Column(db.String(50), nullable=False)
    freshwater_withdraw: db.Column(db.String(50), nullable=False)
    food_group_id = db.Column(db.Integer, db.ForeignKey('food_group.food_group_id'), nullable=False)
    source_id = db.Column(db.Integer, db.ForeignKey('food_source.source_id'), nullable=False)
    nutrition_id = db.Column(db.Integer, db.ForeignKey('nutrition.nutrition_id'), nullable=False)

    ingredient = db.relationship('Ingredient', backref='ingredient')
