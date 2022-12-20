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

@app.route("/OWL", methods=['GET', 'POST'])
def index_OWL():
    return render_template("OWL_index.jinja")

@app.route("/OWL/consultas", methods=['GET', 'POST'])
def OWL_queries():
    return render_template("OWL_queries.jinja")

@app.route("/XML", methods=['GET', 'POST'])
def index_XML():
    return render_template("XML_index.jinja")


@app.route("/XML/xml-xml", methods=['GET', 'POST'])
def xml_xml():
    return render_template("xml-xml.jinja")

    
@app.route("/XML/xml-xml-resultado", methods=['GET', 'POST'])
def xml_xml_result():
    return render_template("xml-xml_result.jinja")


@app.route("/XML/xml-html", methods=['GET', 'POST'])
def xml_html():
    return render_template("xml-html.jinja")


@app.route("/XML/xml-html/resultado", methods=['GET', 'POST'])
def xml_html_result():
    return render_template("bycicle_accidents.jinja")


@app.route("/XML/Xqueries", methods=['GET', 'POST'])
def xqueries():
    return render_template("xqueries.jinja")

@app.route("/XML/Xqueries-resultado", methods=['GET', 'POST'])
def xqueries_result():
    return render_template("xquery_result.jinja")

if __name__ == "__main__":
    # app.run(debug=True)
    app.run(port=5000, debug=True)
