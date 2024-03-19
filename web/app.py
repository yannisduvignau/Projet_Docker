from flask import Flask, render_template
import psycopg2

app = Flask(__name__)

# Configuration de la connexion à la base de données
def connect_to_database():
    conn = psycopg2.connect(
        dbname='world',
        user='docker',
        password='docker',
        host='database',  # Nom du service Docker Compose pour la base de données
        port='5432'      # Port par défaut pour PostgreSQL
    )
    return conn

# Fonction pour récupérer les données de la base de données
def get_data_from_database():
    conn = connect_to_database()
    cur = conn.cursor()
    cur.execute("SELECT * FROM CD;")
    data = cur.fetchall()
    conn.close()
    return data

# Route pour récupérer des données à partir de la base de données
@app.route('/')
def index():
    data = get_data_from_database()
    return render_template('index.html', data=data)
    

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
