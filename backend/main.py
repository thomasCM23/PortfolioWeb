from flask import Flask
from flask_restful import Resource, Api
import json
from text_generation.inference import TextGeneration

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

class GenerateText(Resource):
    def get(self):
        gen = TextGeneration("Hello", 100, 1)
        return {'text': gen.generate_text()}


api.add_resource(HelloWorld, '/')
api.add_resource(ProjectList, '/projects/<string:proj_type>')
api.add_resource(GenerateText, '/generate-text')

@app.after_request
def add_headers(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    return response

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
