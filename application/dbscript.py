from application import db
from application.models.user_table import UserTable

#from application.models.teams import Teams


from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql+pymysql://root:password@localhost/foodstories2504', echo=True)
Session = sessionmaker(bind=engine)

session = Session()