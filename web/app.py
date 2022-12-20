from flask import (
    Flask,
    redirect,
    render_template,
    request,
    abort,
)
import uuid
import pandas as pd


APP_SECRET_KEY = default=uuid.uuid4().hex

app = Flask(__name__)
app.config['SECRET_KEY'] = APP_SECRET_KEY

@app.route("/", methods=['GET', 'POST'])
def index():
    return render_template("index.jinja")


@app.route("/dataset", methods=['GET', 'POST'])
def dataset():
    dta = pd.read_csv("Bycicles-accidents-project/dataset/final_dataset_100samples.csv", sep=";", decimal=".")
    print(dta.to_string())
    return render_template("show_dataset.jinja", dataset=dta)


@app.route("/xslt1", methods=['GET', 'POST'])
def xslt1():
    return render_template("index.jinja")


@app.route("/xslt2", methods=['GET', 'POST'])
def xslt2():
    return render_template("index.jinja")

if __name__ == "__main__":
    # app.run(debug=True)
    app.run(port=5000, debug=True)
