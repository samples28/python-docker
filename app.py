from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
  


  return 'Hello, Docker!20210201'
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
