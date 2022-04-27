#from application.models.teams import Teams

from sqlalchemy import create_engine
from sqlalchemy.orm import sess, sessionmaker

engine = create_engine('mysql+pymysql://root:password@localhost/foodstories', echo=True)
Session = sessionmaker(bind=engine)

session = Session()
