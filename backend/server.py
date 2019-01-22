from flask import Flask
from flask_restful import Resource, Api
import json

app = Flask(__name__)
api = Api(app)


class HelloWorld(Resource):
    def get(self):
        return {'hello': "world"}


class ProjectList(Resource):
    def get(self, proj_type):
        with open('data/db.json') as handle:
            db_data = json.loads(handle.read())

        return db_data[proj_type]


api.add_resource(HelloWorld, '/')
api.add_resource(ProjectList, '/projects/<string:proj_type>')

@app.after_request
def add_headers(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    return response

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
