from flask import Blueprint, request, jsonify
from ..models import HealthOperator

api_bp = Blueprint('api', __name__)

@api_bp.route('/search', methods=['GET'])
def search_operators():
    search_term = request.args.get('q', '').lower()

    if not search_term:
        return jsonify({"error": "Search term is required"}), 400

    operators = HealthOperator.query.filter(
        HealthOperator.company_name.ilike(f"%{search_term}%")
    ).all()

    results = [{
        "id": op.id,
        "tax_id": op.tax_id,
        "company_name": op.company_name,
        "trading_name": op.trading_name,
        "city": op.city,
        "state": op.state
    } for op in operators]

    return jsonify(results)