from flask import Flask
from flask_restful import Resource, Api, reqparse, abort
import json
import uuid
import re
from text_generation.inference import TextGeneration
from translation.nmt import NeuralMachineTranslation

app = Flask(__name__)
api = Api(app)

parser = reqparse.RequestParser()
parser.add_argument('original_text')
parser.add_argument('word')
parser.add_argument('length')
parser.add_argument('temperature')
parser.add_argument('langauge')

class HelloWorld(Resource):
    def get(self):
        return {'hello': "world"}


class ProjectList(Resource):
    def get(self, proj_type):
        with open('data/db.json') as handle:
            db_data = json.loads(handle.read())

        return db_data[proj_type]

class GenerateText(Resource):
    def post(self):
        args = parser.parse_args()
        gen = TextGeneration(args['word'], int(args['length']), int(args['temperature']))
        return {'text': gen.generate_text()}

class Translate(Resource):
    def post(self):
        args = parser.parse_args()
        print(args)
        txt_to_translate = re.sub('([.,!?();:"])', r' \1 ', args['original_text'])
        txt_to_translate = re.sub('\s{2,}', ' ', txt_to_translate)
        print(txt_to_translate)
        nmt = NeuralMachineTranslation()
        try:
            translated_txt = nmt.start_inference_nmt(txt_to_translate, str(uuid.uuid4()) + '.txt', args['langauge'])
            translated_txt = re.sub(r'\s([.,!?();:"](?:\s|$))', r'\1', translated_txt)
        except Exception as e:
            translated_txt = "The language " + args['langauge'] + " has not yet been implemented"

        return {'text': translated_txt.replace("&apos;", "'")}



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
    app.run(host='0.0.0.0', port=8000, debug=True)
