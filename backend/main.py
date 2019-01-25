from flask import Flask
from flask_restful import Resource, Api, reqparse, abort
import json
import uuid
from text_generation.inference import TextGeneration
from translation.nmt import NeuralMachineTranslation

app = Flask(__name__)
api = Api(app)

parser = reqparse.RequestParser()
parser.add_argument('original_text')

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

class Translate(Resource):
    def get(self):
        args = parser.parse_args()
        print(args)
        test_txt = args['original_text']
        nmt = NeuralMachineTranslation()
        translated_txt = nmt.start_inference_nmt(test_txt, str(uuid.uuid4()) + '.txt')
        return {'text': translated_txt}


api.add_resource(HelloWorld, '/')
api.add_resource(ProjectList, '/projects/<string:proj_type>')
api.add_resource(GenerateText, '/generate-text')
api.add_resource(Translate, '/translate-text')

@app.after_request
def add_headers(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    return response

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
