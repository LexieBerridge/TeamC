from application import db
from dataclasses import dataclass

@dataclass
class Nutrition(db.Model):
    # the declarations below are important for turning the object into JSON
    nutrition_id: int
    energy_kcal: int
    energy_kj: int
    fat: str
    saturate: str
    carbohydrate: str
    sugar: str
    starch: str
    fibre: str
    protein: str
    salt: str

    nutrition_id: db.Column(db.Integer, primary_key=True)
    energy_kcal: db.Column(db.Integer)
    energy_kj: db.Column(db.Integer)
    fat: db.Column(db.String(10)
    saturate: db.Column(db.String(10)
    carbohydrate: db.Column(db.String(10)
    sugar: db.Column(db.String(10)
    starch: db.Column(db.String(10)
    fibre: db.Column(db.String(10)
    protein: db.Column(db.String(10)
    salt: db.Column(db.String(10)

    food_item = db.relationship('Food_item', backref='food_item')

#     TODO: ask Martina if we need to call any collumn that uses a forgeign ID we need to use a different collumn name
#       to the one we take the foreign id from. As in when her heroes table took id from teams it called the collumn
#           teamsid not id. However this may have only been because she already had a collumn with the name id


