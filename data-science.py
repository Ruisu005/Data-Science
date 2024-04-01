import tkinter as tk
from tkinter import messagebox, Toplevel
import mysql.connector
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from PIL import Image, ImageTk

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
    mostrar_dashboard(consulta, "Ingresos totales por veterinario", "bar")

def indicador2():
    consulta = """
    SELECT nombre, COUNT(*) AS num_visitas
    FROM mascotas
    JOIN veterinario ON mascotas.fk_veterinario = veterinario.id_v
    GROUP BY nombre;
    """
    mostrar_dashboard(consulta, "Número de visitas por mascota", "bar")

def indicador3():
    consulta = """
    SELECT nombre_tipo, SUM(precio) AS ingresos_totales
    FROM tipo
    JOIN medicinas ON tipo.id_tipo = medicinas.fk_tipo
    JOIN mascotas ON medicinas.id_medicina = mascotas.fk_medicina
    GROUP BY nombre_tipo;
    """
    mostrar_dashboard(consulta, "Ingresos totales por tipo de medicina", "pie")

def indicador4():
    consulta = """
    SELECT nombre_medicina, COUNT(*) AS num_recetas
    FROM medicinas
    JOIN mascotas ON medicinas.id_medicina = mascotas.fk_medicina
    GROUP BY nombre_medicina
    ORDER BY num_recetas DESC
    LIMIT 5;
    """
    mostrar_dashboard(consulta, "Top 5 de medicinas más recetadas", "bar")

def indicador5():
    consulta = """
    SELECT nombre_dueño, SUM(precio_medicina)
    FROM Dim_Dueño
    INNER JOIN Dim_Mascota ON Dim_Dueño.id_dueño = Dim_Mascota.fk_dueño
    INNER JOIN Hecho_Visita ON Dim_Mascota.id_mascota = Hecho_Visita.fk_mascota
    GROUP BY nombre_dueño;
    """
    mostrar_dashboard(consulta, "Ingresos totales por dueño", "bar")

def indicador6():
    consulta = """
    SELECT nombre_dueño, COUNT(*) AS num_mascotas
    FROM Dim_Dueño
    INNER JOIN Dim_Mascota ON Dim_Dueño.id_dueño = Dim_Mascota.fk_dueño
    GROUP BY nombre_dueño;
    """
    mostrar_dashboard(consulta, "Número de mascotas por dueño", "bar")

# Función para ejecutar una consulta SQL y mostrar los resultados en un gráfico
def mostrar_dashboard(consulta, titulo, tipo_grafico):
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
        generar_grafico(resultados, titulo, tipo_grafico)
        cursor.close()
        conexion.close()
    except mysql.connector.Error as error:
        messagebox.showerror("Error", f"Ocurrió un error: {error}")

# Función para generar un gráfico a partir de los resultados de la consulta SQL
def generar_grafico(resultados, titulo, tipo_grafico):
    ventana = Toplevel(root)
    ventana.title(titulo)

    etiquetas = [fila[0] for fila in resultados]
    valores = [fila[1] for fila in resultados]

    fig, ax = plt.subplots()
    if tipo_grafico == "bar":
        ax.bar(etiquetas, valores)
    elif tipo_grafico == "pie":
        ax.pie(valores, labels=etiquetas, autopct='%1.1f%%', startangle=90)

    ax.set_xlabel('Categoría')
    ax.set_ylabel('Valor')
    ax.set_title(titulo)

    canvas = FigureCanvasTkAgg(fig, master=ventana)
    canvas.draw()
    canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)

# Crear la ventana principal
root = tk.Tk()
root.title("Dashboard de Indicadores")

# Cargar y mostrar el ícono de la ventana
icon_image = Image.open("data.png")
icono_photo = ImageTk.PhotoImage(icon_image)

root.iconphoto(True, icono_photo)


# Cargar y mostrar el logo arriba de los botones
logo_image = Image.open("data-science-logo.png")
logo_photo = ImageTk.PhotoImage(logo_image)

logo_label = tk.Label(root, image=logo_photo)
logo_label.pack()

# Cargar y mostrar la imagen de fondo que se ajusta al tamaño de la ventana
background_image = Image.open("data-science-background.jpg")
background_photo = ImageTk.PhotoImage(background_image)

background_label = tk.Label(root, image=background_photo)
background_label.place(relwidth=1, relheight=1)

# Crear botones para cada indicador con diseño personalizado
btn_indicador1 = tk.Button(root, text="Ingresos por Veterinario", command=indicador1, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador1.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador2 = tk.Button(root, text="Número de Visitas por Mascota", command=indicador2, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador2.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador3 = tk.Button(root, text="Ingresos por Tipo de Medicina", command=indicador3, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador3.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador4 = tk.Button(root, text="Top 5 de Medicinas más Recetadas", command=indicador4, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador4.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador5 = tk.Button(root, text="Ingresos por Dueño", command=indicador5, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador5.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador6 = tk.Button(root, text="Número de Mascotas por Dueño", command=indicador6, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador6.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

# Ejecutar el bucle principal
root.mainloop()
