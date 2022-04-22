from flask import Flask, request
from datetime import datetime
import os
import subprocess

app = Flask(__name__)

@app.route('/')
def hello():
    name = request.args['name']
    result_success = subprocess.check_output(
        [name], shell=True)
    return result_success

HELLO_HTML = """
     <html><body>
         <h1>Hello, {0}!</h1>.
     </body></html>"""


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True,host='0.0.0.0',port=port)
