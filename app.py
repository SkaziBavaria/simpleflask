#importing the needed packages and modules
from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
import yaml
app = Flask(__name__)

#Configure db
db = yaml.safe_load(open('db.yaml'))
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:rootpassword@db/flaskapp'
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

# CORS(app)
# db = SQLAlchemy(app)
mysql = MySQL(app)

@app.route('/', methods=['GET','POST'])
def hello():
    if request.method == 'POST':
        #Fetch form data
        userDetails = request.form
        name = userDetails['name']
        email = userDetails['email']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users(name, email) VALUES(%s, %s)",(name, email))
        mysql.connection.commit()
        cur.close()
        return redirect('/users')
    return render_template('index.html')
 
@app.route('/users')
def users():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM users")
    if resultValue > 0:
        userDetails = cur.fetchall()
        return render_template('users.html',userDetails=userDetails)

if __name__ == '__main__':
    
    app.run(debug=True, host='0.0.0.0')