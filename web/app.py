from datetime import datetime
from http.client import HTTPException
from typing import Any, AnyStr, List, Optional, Set, Tuple
from pathlib import Path

import werkzeug
from flask import (
    Flask,
    flash,
    redirect,
    render_template,
    request,
    abort,
)
from werkzeug.utils import secure_filename
from werkzeug import Response
import uuid


APP_SECRET_KEY = default=uuid.uuid4().hex

app = Flask(__name__)
app.config['SECRET_KEY'] = APP_SECRET_KEY

@app.route("/", methods=['GET', 'POST'])
def index():
    return render_template("index.jinja")

if __name__ == "__main__":
    # app.run(debug=True)
    app.run(port=5000, debug=True)
