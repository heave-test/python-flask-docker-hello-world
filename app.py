from flask import Flask
import os

app = Flask(__name__)


# def hello():
#     return "Flask inside Docker!!"

@app.route("/")
def hello():
     name = request.args['name']
     return HELLO_HTML.format(
             name, str(datetime.now()))

HELLO_HTML = """
     <html><body>
         <h1>Hello, {0}!</h1>
         The time is {1}.
     </body></html>"""

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True,host='0.0.0.0',port=port)
