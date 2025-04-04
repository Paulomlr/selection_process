from ..models import db

class HealthOperator(db.Model):
    __tablename__ = "operadoras_ativas"

    id = db.Column("registro_ans", db.Integer, primary_key=True)
    tax_id = db.Column("cnpj", db.String(18), nullable=False)
    company_name = db.Column("razao_social", db.String(255), nullable=False)
    trading_name = db.Column("nome_fantasia", db.String(255))
    city = db.Column("cidade", db.String(100))
    state = db.Column("uf", db.String(5))