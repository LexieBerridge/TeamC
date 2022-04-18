from application import db
from dataclasses import dataclass

@dataclass
class FoodSource(db.Model):
    # the declarations below are important for turning the object into JSON
    source_id: int
    source_image: str
    source_fact: str
    source_season: str

    source_id: db.Column(db.Integer, primary_key=True)
    group_image: db.Column(db.String(50))
    group_fact: db.Column(db.String(10))
    group_season: db.Column(db.String(10))

    food_item = db.relationship('FoodItem', backref='food_item')
