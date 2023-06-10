#!/usr/bin/python
import json
import sqlite3
from flask import Flask, request, jsonify
from flask_cors import CORS


def connect_to_db():
    conn = sqlite3.connect('database.db')
    return conn

def create_db_table_plantas():
    try:
        conn = connect_to_db()
        conn.execute('''DROP TABLE plantas''')
        conn.execute('''
            CREATE TABLE plantas (
                id INTEGER PRIMARY KEY NOT NULL,
                nome TEXT NOT NULL,
                especie TEXT NOT NULL,
                nomecientifico TEXT NOT NULL,
                userId TEXT NOT NULL
            );
        ''')

        conn.commit()
        print("User table created successfully")
    except:
        print("User table creation failed - Maybe table")
    finally:
        conn.close()
        
def create_db_table_doenca_plantas():
    try:
        conn = connect_to_db()
        #conn.execute('''DROP TABLE plantas''')
        conn.execute('''
            CREATE TABLE doencaplantas (
                id INTEGER PRIMARY KEY NOT NULL,
                nome TEXT NOT NULL,
                planta TEXT NOT NULL,
                combate TEXT NOT NULL,
                userId TEXT NOT NULL
            );
        ''')

        conn.commit()
        print("User table created successfully")
    except:
        print("User table creation failed - Maybe table")
    finally:
        conn.close()

def create_db_table_tarefas():
    try:
        conn = connect_to_db()
        #conn.execute('''DROP TABLE plantas''')
        conn.execute('''
            CREATE TABLE tarefas (
                id INTEGER PRIMARY KEY NOT NULL,
                titulo TEXT NOT NULL,
                descricao TEXT NOT NULL,
                status TEXT NOT NULL,
                userId TEXT NOT NULL
            );
        ''')

        conn.commit()
        print("User table created successfully")
    except:
        print("User table creation failed - Maybe table")
    finally:
        conn.close()

#Plantas
def insert_planta(planta):
    inserted_planta = {}
    try:
        conn = connect_to_db()
        cur = conn.cursor()
        cur.execute("INSERT INTO plantas (nome, especie, nomecientifico, userId) VALUES (?, ?, ?, ?)", (planta['nome'], planta['especie'], planta['nomecientifico'], planta['userId'] ))
        conn.commit()
        inserted_planta = get_planta_by_id(cur.lastrowid)
    except:
        conn().rollback()

    finally:
        conn.close()

    return inserted_planta

def get_plantas():
    plantas = []
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM plantas")
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            planta = {}
            planta["id"] = i["id"]
            planta["nome"] = i["nome"]
            planta["especie"] = i["especie"]
            planta["nomecientifico"] = i["nomecientifico"]
            planta["userId"] = i["userId"]
            plantas.append(planta)

    except:
        plantas = []

    return plantas


def get_planta_by_id(planta_id):
    planta = {}
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM plantas WHERE id = ?", (planta_id,))
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            planta["id"] = i["id"]
            planta["nome"] = i["nome"]
            planta["especie"] = i["especie"]
            planta["nomecientifico"] = i["nomecientifico"]
            planta["userId"] = i["userId"]
    except:
         planta = {}

    return planta

#DoencaPlantas
def insert_doencaplanta(doencaPlanta):
    inserted_doencaPlanta = {}
    try:
        conn = connect_to_db()
        cur = conn.cursor()
        cur.execute("INSERT INTO doencaplantas (nome, planta, combate, userId) VALUES (?, ?, ?, ?)", (doencaPlanta['nome'], doencaPlanta['planta'], doencaPlanta['combate'],  doencaPlanta['userId']))
        conn.commit()
        inserted_doencaPlanta = get_doencaplanta_by_id(cur.lastrowid)
    except:
        conn().rollback()

    finally:
        conn.close()

    return inserted_doencaPlanta

def get_doencaplantas():
    doencaPlantas = []
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM doencaplantas")
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            doencaPlanta = {}
            doencaPlanta["id"] = i["id"]
            doencaPlanta["nome"] = i["nome"]
            doencaPlanta["planta"] = i["planta"]
            doencaPlanta["combate"] = i["combate"]
            doencaPlanta["userId"] = i["userId"]
            doencaPlantas.append(doencaPlanta)

    except:
        doencaPlantas = []

    return doencaPlantas


def get_doencaplanta_by_id(doencaPlanta_id):
    doencaPlanta = {}
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM doencaplantas WHERE id = ?", (doencaPlanta_id,))
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            doencaPlanta["id"] = i["id"]
            doencaPlanta["nome"] = i["nome"]
            doencaPlanta["planta"] = i["planta"]
            doencaPlanta["combate"] = i["combate"]
            doencaPlanta["userId"] = i["userId"]
    except:
         doencaPlanta = {}

    return doencaPlanta

#Tarefa
def insert_tarefa(tarefa):
    inserted_tarefa= {}
    try:
        conn = connect_to_db()
        cur = conn.cursor()
        cur.execute("INSERT INTO tarefas (titulo, descricao, status, userId) VALUES (?, ?, ?, ?)", (tarefa['titulo'], tarefa['descricao'], tarefa['status'], tarefa['userId'] ))
        conn.commit()
        inserted_tarefa = get_tarefa_by_id(cur.lastrowid)
    except:
        conn().rollback()

    finally:
        conn.close()

    return inserted_tarefa


def update_tarefa(tarefa):
    updated_tarefa = {}
    try:
        conn = connect_to_db()
        cur = conn.cursor()
        cur.execute("UPDATE tarefas SET status = ? WHERE id =?", (tarefa["status"], tarefa["id"],))
        conn.commit()
        updated_tarefa = get_tarefa_by_id(tarefa["id"])

    except:
        conn.rollback()
        updated_tarefa = {}
    finally:
        conn.close()

    return updated_tarefa

def get_tarefas():
    tarefas = []
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM tarefas")
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            tarefa = {}
            tarefa["id"] = i["id"]
            tarefa["titulo"] = i["titulo"]
            tarefa["descricao"] = i["descricao"]
            tarefa["status"] = i["status"]
            tarefa["userId"] = i["userId"]
            tarefas.append(tarefa)

    except:
        tarefas = []

    return tarefas

def get_tarefa_by_id(tarefa_id):
    tarefa = {}
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM tarefas WHERE id = ?", (tarefa_id,))
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            tarefa["id"] = i["id"]
            tarefa["titulo"] = i["titulo"]
            tarefa["descricao"] = i["descricao"]
            tarefa["status"] = i["status"]
            tarefa["userId"] = i["userId"]
    except:
         tarefa = {}

    return tarefa

def get_tarefa_by_status_and_userId(tarefa_status, tarefa_userId):
    tarefas = []
    try:
        conn = connect_to_db()
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT * FROM tarefas WHERE status = ? and userid = ?", (tarefa_status,tarefa_userId,))
        rows = cur.fetchall()

        # convert row objects to dictionary
        for i in rows:
            tarefa = {}
            tarefa["id"] = i["id"]
            tarefa["titulo"] = i["titulo"]
            tarefa["descricao"] = i["descricao"]
            tarefa["status"] = i["status"]
            tarefa["userId"] = i["userId"]
            tarefas.append(tarefa)
    except:
         tarefas = []

    return tarefas


def delete_tarefa(tarefa_id):
    message = {}
    try:
        conn = connect_to_db()
        conn.execute("DELETE from tarefas WHERE id = ?", (tarefa_id,))
        conn.commit()
        message["status"] = "Tarefa deletada com sucesso"
    except:
        conn.rollback()
        message["status"] = "Erro ao deletar a tarefa"
    finally:
        conn.close()

    return message

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})

#Plantas
@app.route('/api/plantas/add',  methods = ['POST'])
def api_add_planta():
    planta = request.get_json()
    return jsonify(insert_planta(planta))

@app.route('/api/plantas', methods=['GET'])
def api_get_plantas():
    return jsonify(get_plantas())

@app.route('/api/export-plantas', methods=['GET'])
def api_export_plantas():
    data = get_plantas()
    f = open("C:/output/plantas.json", "w")
    json.dump(data, f, sort_keys = True, indent=4)
    f.close()
    return jsonify(data)
@app.route('/api/import-planta', methods=['POST'])
def api_import_planta():
    f = open("C:/input/planta.json", "r")
    data = json.load(f)
    f.close()
    return jsonify(insert_planta(data))

#Doenca Plantas
@app.route('/api/doencaplantas/add',  methods = ['POST'])
def api_add_doencaplanta():
    planta = request.get_json()
    return jsonify(insert_doencaplanta(planta))
@app.route('/api/doencaplantas', methods=['GET'])
def api_get_doencaplantas():
    return jsonify(get_doencaplantas())
@app.route('/api/export-doencas', methods=['GET'])
def api_export_doencas():
    data = get_doencaplantas()
    f = open("C:/output/doencas.json", "w")
    json.dump(data, f, sort_keys = True, indent=4)
    f.close()
    return jsonify(data)
@app.route('/api/import-doenca', methods=['POST'])
def api_import_doencas():
    f = open("C:/input/doenca.json", "r")
    data = json.load(f)
    f.close()
    return jsonify(insert_doencaplanta(data))

#Tarefas
@app.route('/api/tarefas/add',  methods = ['POST'])
def api_add_tarefa():
    tarefa = request.get_json()
    return jsonify(insert_tarefa(tarefa))

@app.route('/api/tarefas/update',  methods = ['PUT'])
def api_update_tarefa():
    tarefa = request.get_json()
    return jsonify(update_tarefa(tarefa))

@app.route('/api/tarefas', methods=['GET'])
def api_get_tarefas():
    return jsonify(get_tarefas())

@app.route('/api/tarefas/<tarefaStatus>/<tarefaUserId>', methods=['GET'])
def api_get_tarefa_status(tarefaStatus, tarefaUserId):
    return jsonify(get_tarefa_by_status_and_userId(tarefaStatus, tarefaUserId))

@app.route('/api/tarefas/<tarefaId>',  methods = ['DELETE'])
def api_delete_tarefa(tarefaId):
    return jsonify(delete_tarefa(tarefaId))

@app.route('/api/export-tarefas', methods=['GET'])
def api_export_tarefas():
    data = get_tarefas()
    f = open("C:/output/tarefas.json", "w")
    json.dump(data, f, sort_keys = True, indent=4)
    f.close()
    return jsonify(data)

@app.route('/api/import-tarefa', methods=['POST'])
def api_import_tarefas():
    f = open("C:/input/tarefa.json", "r")
    data = json.load(f)
    f.close()
    return jsonify(insert_tarefa(data))

if __name__ == "__main__":
    app.run()