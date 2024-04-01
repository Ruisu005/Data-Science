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

# Indicador 6: Número de mascotas por dueño
cursor.execute("""
    SELECT nombre_dueño, COUNT(*) AS num_mascotas
    FROM Dim_Dueño
    INNER JOIN Dim_Mascota ON Dim_Dueño.id_dueño = Dim_Mascota.fk_dueño
    GROUP BY nombre_dueño
""")
mascotas_por_dueño = cursor.fetchall()

# Convertir los resultados en listas separadas para el gráfico
nombres_dueños = [fila[0] for fila in mascotas_por_dueño]
num_mascotas = [fila[1] for fila in mascotas_por_dueño]

# Crear el gráfico de barras horizontales
plt.barh(nombres_dueños, num_mascotas)
plt.xlabel('Número de Mascotas')
plt.ylabel('Dueño')
plt.title('Número de Mascotas por Dueño')
plt.tight_layout()

# Mostrar el gráfico
plt.show()

# Cerrar cursor y conexión
cursor.close()
conexion.close()
