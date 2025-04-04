from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

from .health_operator import HealthOperator