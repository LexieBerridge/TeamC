from application import db
from dataclasses import dataclass

@dataclass
class UserTable(db.Model):
    # the declarations below are important for turning the object into JSON
    user_id: int
    user_name: str
    user_age: int

    user_id = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(10), nullable=False)
    user_age = db.Column(db.Integer)
    liked = db.relationship('Liked', backref='liked')
    # TODO: user_name in user_table need more than 10 chars?