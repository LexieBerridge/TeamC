from application import db

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql+pymysql://root:password@localhost/foodstories2504', echo=True)
Session = sessionmaker(bind=engine)

session = Session()