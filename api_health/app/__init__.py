from flask import Flask
from flask_cors import CORS
from .configs.settings import Config
from .models import db
from .routes import api_bp

def create_app():
    app = Flask(__name__)
    CORS(app)

    app.config.from_object(Config)

    db.init_app(app)

    app.register_blueprint(api_bp)

    with app.app_context():
        db.create_all()

    return app