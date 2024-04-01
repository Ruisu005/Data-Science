import mysql.connector
import matplotlib.pyplot as plt

# Conectarse a la base de datos
conexion = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="veterinaria"
)

# Crear un cursor para ejecutar consultas SQL
cursor = conexion.cursor()

# Indicador 5: Ingresos totales por dueño
cursor.execute("""
    SELECT nombre_dueño, SUM(precio_medicina)
    FROM Dim_Dueño
    INNER JOIN Dim_Mascota ON Dim_Dueño.id_dueño = Dim_Mascota.fk_dueño
    INNER JOIN Hecho_Visita ON Dim_Mascota.id_mascota = Hecho_Visita.fk_mascota
    GROUP BY nombre_dueño
""")
ingresos_por_dueño = cursor.fetchall()

# Convertir los resultados en listas separadas para el gráfico
nombres_dueños = [fila[0] for fila in ingresos_por_dueño]
ingresos = [fila[1] for fila in ingresos_por_dueño]

# Crear el gráfico de barras horizontales
plt.barh(nombres_dueños, ingresos)
plt.xlabel('Ingresos Totales')
plt.ylabel('Dueño')
plt.title('Ingresos Totales por Dueño')
plt.tight_layout()

# Mostrar el gráfico
plt.show()

# Cerrar cursor y conexión
cursor.close()
conexion.close()
