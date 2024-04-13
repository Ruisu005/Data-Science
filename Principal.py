import tkinter as tk
from tkinter import messagebox, Toplevel
import mysql.connector
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from PIL import Image, ImageTk

# Funciones para ejecutar los indicadores al hacer clic en los botones
def indicador1():
    consulta = """
    SELECT Tipos_tratamientos AS Tipo_de_tratamiento, COUNT(*) AS Cantidad
    FROM visitas
    JOIN tratamientos ON visitas.Idtratamiento = tratamientos.Idtratamiento
    GROUP BY Tipos_tratamientos
    ORDER BY Cantidad DESC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Tipo de tratamiento más solicitado", "bar")

def indicador2():
    consulta = """
    SELECT Animales AS Tipo_de_animal, COUNT(*) AS Cantidad
    FROM animales
    JOIN tpanimales ON animales.Idtipo = tpanimales.Idtipo
    GROUP BY Animales
    ORDER BY Cantidad DESC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Tipo de animal más registrado", "bar")

def indicador3():
    consulta = """
    SELECT m.Nombre AS Medicamento, t.Tipos_tratamientos AS Tratamiento, COUNT(*) AS Cantidad_de_solicitudes
    FROM visitas v
    JOIN medicamentos m ON v.Idmedicamentos = m.Idmedicamentos
    JOIN tratamientos t ON v.Idtratamiento = t.Idtratamiento
    JOIN fecha f ON v.Idfecha = f.Idfecha
    GROUP BY m.Nombre, t.Tipos_tratamientos
    ORDER BY Cantidad_de_solicitudes DESC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Medicamento más solicitado durante la semana y su tratamiento", "bar")

def indicador4():
    consulta = """
    SELECT Zona, COUNT(*) AS Cantidad_de_perros
    FROM animales a
    JOIN cliente c ON a.Idcliente = c.Idcliente
    JOIN tpanimales t ON a.Idtipo = t.Idtipo
    WHERE t.Animales = 'Perro'
    GROUP BY Zona
    ORDER BY Cantidad_de_perros DESC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Zona con más perros registrados", "bar")

def indicador5():
    consulta = """
    SELECT Dia_semana, COUNT(*) AS Cantidad_de_visitas
    FROM visitas v
    JOIN fecha f ON v.Idfecha = f.Idfecha
    GROUP BY Dia_semana
    ORDER BY Cantidad_de_visitas DESC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Día de la semana más solicitado", "bar")

def indicador6():
    consulta = """
    SELECT f.Dia_semana, COUNT(*) AS Cantidad_de_visitas
    FROM visitas v
    JOIN animales a ON v.Idanimales = a.Idanimales
    JOIN tpAnimales tp ON a.Idtipo = tp.Idtipo
    JOIN fecha f ON v.Idfecha = f.Idfecha
    WHERE tp.Animales = 'Perro'
    GROUP BY f.Dia_semana
    ORDER BY Cantidad_de_visitas DESC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Día de la semana con más visitas para perros", "bar")

def indicador7():
    consulta = """
    SELECT tr.Tipos_tratamientos AS Tipo_de_tratamiento, m.Nombre AS Medicamento, SUM(v.Monto_a_pagar) AS Ingresos_por_medicamento
    FROM visitas v
    JOIN medicamentos m ON v.Idmedicamentos = m.Idmedicamentos
    JOIN tratamientos tr ON v.Idtratamiento = tr.Idtratamiento
    GROUP BY tr.Tipos_tratamientos, m.Nombre
    ORDER BY Tipo_de_tratamiento, Ingresos_por_medicamento DESC;
    """
    mostrar_dashboard(consulta, "Medicamento más rentable por tipo de tratamiento", "bar")

def indicador8():
    consulta = """
    SELECT c.Nombre AS Cliente, COUNT(*) AS Cantidad_de_animales_registrados
    FROM cliente c
    JOIN animales a ON c.Idcliente = a.Idcliente
    GROUP BY c.Nombre
    ORDER BY Cantidad_de_animales_registrados DESC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Cliente con mayor cantidad de animales registrados", "bar")

def indicador9():
    consulta = """
    SELECT f.Dia_semana, COUNT(*) AS Cantidad_de_tratamientos_realizados
    FROM visitas v
    JOIN fecha f ON v.Idfecha = f.Idfecha
    GROUP BY f.Dia_semana
    ORDER BY Cantidad_de_tratamientos_realizados DESC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Día de la semana con mayor cantidad de tratamientos realizados", "bar")

def indicador10():
    consulta = """
    SELECT tp.Animales AS Tipo_de_animal, COUNT(*) AS Total_registrados
    FROM animales a
    JOIN tpAnimales tp ON a.Idtipo = tp.Idtipo
    JOIN visitas v ON a.Idanimales = v.Idanimales
    JOIN fecha f ON v.Idfecha = f.Idfecha
    WHERE f.Mes = 'febrero'
    GROUP BY tp.Animales
    ORDER BY Total_registrados DESC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Animal más registrado en el mes de febrero", "bar")

def indicador11():
    consulta = """
    SELECT tp.Animales AS Tipo_de_animal, COUNT(*) AS Total_registrados
    FROM animales a
    JOIN tpAnimales tp ON a.Idtipo = tp.Idtipo
    JOIN visitas v ON a.Idanimales = v.Idanimales
    JOIN fecha f ON v.Idfecha = f.Idfecha
    WHERE f.Mes = 'Febrero'
    GROUP BY tp.Animales
    ORDER BY Total_registrados ASC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Animal menos registrado en el mes de febrero", "bar")

def indicador12():
    consulta = """
    SELECT tp.Animales AS Tipo_de_animal, COUNT(*) AS Total_registrados
    FROM animales a
    JOIN tpAnimales tp ON a.Idtipo = tp.Idtipo
    LEFT JOIN visitas v ON a.Idanimales = v.Idanimales
    GROUP BY tp.Animales
    ORDER BY Total_registrados ASC
    LIMIT 1;
    """
    mostrar_dashboard(consulta, "Animal menos registrado de todos", "bar")

def indicador13():
    consulta = """
    SELECT tp.Animales AS Tipo_de_animal, COUNT(*) AS Total_registros
    FROM animales a
    JOIN tpAnimales tp ON a.Idtipo = tp.Idtipo
    GROUP BY tp.Animales;
    """
    mostrar_dashboard(consulta, "Total de registros por cada tipo de animal", "bar")

# Función para ejecutar una consulta SQL y mostrar los resultados en un gráfico
def mostrar_dashboard(consulta, titulo, tipo_grafico):
    try:
        conexion = mysql.connector.connect(
            host="localhost",
            user="root",
            password="250703",
            database="veterinario"
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
btn_indicador1 = tk.Button(root, text="Tipo de tratamiento más solicitado", command=indicador1, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador1.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador2 = tk.Button(root, text="Tipo de animal más registrado", command=indicador2, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador2.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador3 = tk.Button(root, text="Medicamento más solicitado durante la semana y su tratamiento", command=indicador3, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador3.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador4 = tk.Button(root, text="Zona con más perros registrados", command=indicador4, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador4.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador5 = tk.Button(root, text="Día de la semana más solicitado", command=indicador5, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador5.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador6 = tk.Button(root, text="Día de la semana con más visitas para perros", command=indicador6, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador6.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador7 = tk.Button(root, text="Medicamento más rentable por tipo de tratamiento", command=indicador7, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador7.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador8 = tk.Button(root, text="Cliente con mayor cantidad de animales registrados", command=indicador8, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador8.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador9 = tk.Button(root, text="Día de la semana con mayor cantidad de tratamientos realizados", command=indicador9, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador9.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador10 = tk.Button(root, text="Animal más registrado en el mes de febrero", command=indicador10, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador10.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador11 = tk.Button(root, text="Animal menos registrado en el mes de febrero", command=indicador11, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador11.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador12 = tk.Button(root, text="Animal menos registrado de todos", command=indicador12, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador12.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

btn_indicador13 = tk.Button(root, text="Total de registros por cada tipo de animal", command=indicador13, bg="#7FB3D5", fg="white", activebackground="#4682B4", activeforeground="white", relief=tk.FLAT)
btn_indicador13.pack(side=tk.TOP, anchor=tk.CENTER, pady=5)

# Ejecutar el bucle principal
root.mainloop()
