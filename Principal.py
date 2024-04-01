import tkinter as tk
from tkinter import messagebox
import mysql.connector
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

# Funciones para ejecutar los indicadores al hacer clic en los botones
def indicador1():
    consulta = """
    SELECT nombre_vet, SUM(precio) AS ingresos_totales
    FROM veterinario
    JOIN mascotas ON veterinario.id_v = mascotas.fk_veterinario
    JOIN medicinas ON mascotas.fk_medicina = medicinas.id_medicina
    JOIN tipo ON medicinas.fk_tipo = tipo.id_tipo
    GROUP BY nombre_vet;
    """
    ejecutar_consulta(consulta, "Ingresos totales por veterinario")

def indicador2():
    consulta = """
    SELECT nombre, COUNT(*) AS num_visitas
    FROM mascotas
    JOIN veterinario ON mascotas.fk_veterinario = veterinario.id_v
    GROUP BY nombre;
    """
    ejecutar_consulta(consulta, "Número de visitas por mascota")

def indicador3():
    consulta = """
    SELECT nombre_tipo, SUM(precio) AS ingresos_totales
    FROM tipo
    JOIN medicinas ON tipo.id_tipo = medicinas.fk_tipo
    JOIN mascotas ON medicinas.id_medicina = mascotas.fk_medicina
    GROUP BY nombre_tipo;
    """
    ejecutar_consulta(consulta, "Ingresos totales por tipo de medicina")

def indicador4():
    consulta = """
    SELECT nombre_medicina, COUNT(*) AS num_recetas
    FROM medicinas
    JOIN mascotas ON medicinas.id_medicina = mascotas.fk_medicina
    GROUP BY nombre_medicina
    ORDER BY num_recetas DESC
    LIMIT 5;
    """
    ejecutar_consulta(consulta, "Top 5 de medicinas más recetadas")

def indicador5():
    consulta = """
    SELECT nombre_dueño, SUM(precio) AS ingresos_totales
    FROM dueño
    JOIN mascotas ON dueño.id_dueño = mascotas.fk_dueño
    JOIN medicinas ON mascotas.fk_medicina = medicinas.id_medicina
    JOIN tipo ON medicinas.fk_tipo = tipo.id_tipo
    GROUP BY nombre_dueño;
    """
    ejecutar_consulta(consulta, "Ingresos totales por dueño")

def indicador6():
    consulta = """
    SELECT nombre_dueño, COUNT(*) AS num_mascotas
    FROM dueño
    JOIN mascotas ON dueño.id_dueño = mascotas.fk_dueño
    GROUP BY nombre_dueño;
    """
    ejecutar_consulta(consulta, "Número de mascotas por dueño")

# Función para ejecutar una consulta SQL y mostrar los resultados en una ventana emergente
def ejecutar_consulta(consulta, titulo):
    try:
        conexion = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="veterinaria"
        )
        cursor = conexion.cursor()
        cursor.execute(consulta)
        resultados = cursor.fetchall()
        ventana_resultados(resultados, titulo)
        cursor.close()
        conexion.close()
    except mysql.connector.Error as error:
        messagebox.showerror("Error", f"Ocurrió un error: {error}")

# Función para mostrar los resultados en una nueva ventana
def ventana_resultados(resultados, titulo):
    ventana = tk.Toplevel()
    ventana.title(titulo)

    texto_resultados = tk.Text(ventana, wrap=tk.WORD)
    texto_resultados.pack(expand=True, fill=tk.BOTH)

    for fila in resultados:
        texto_resultados.insert(tk.END, str(fila) + "\n")

# Crear la ventana principal
root = tk.Tk()
root.title("Interfaz de Indicadores")

# Crear botones para cada indicador
btn_indicador1 = tk.Button(root, text="Ingresos por Veterinario", command=indicador1)
btn_indicador1.pack()

btn_indicador2 = tk.Button(root, text="Número de Visitas por Mascota", command=indicador2)
btn_indicador2.pack()

btn_indicador3 = tk.Button(root, text="Ingresos por Tipo de Medicina", command=indicador3)
btn_indicador3.pack()

btn_indicador4 = tk.Button(root, text="Top 5 de Medicinas más Recetadas", command=indicador4)
btn_indicador4.pack()

btn_indicador5 = tk.Button(root, text="Ingresos por Dueño", command=indicador5)
btn_indicador5.pack()

btn_indicador6 = tk.Button(root, text="Número de Mascotas por Dueño", command=indicador6)
btn_indicador6.pack()

# Ejecutar el bucle principal
root.mainloop()
