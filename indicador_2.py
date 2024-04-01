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

# Indicador 2: Número de visitas por mascota
cursor.execute("""
    SELECT nombre_mascota, COUNT(*) AS num_visitas
    FROM Dim_Mascota
    INNER JOIN Hecho_Visita ON Dim_Mascota.id_mascota = Hecho_Visita.fk_mascota
    GROUP BY nombre_mascota
""")
visitas_por_mascota = cursor.fetchall()

# Convertir los resultados en listas separadas para el gráfico
nombres_mascotas = [fila[0] for fila in visitas_por_mascota]
num_visitas = [fila[1] for fila in visitas_por_mascota]

# Crear el gráfico de barras
plt.bar(nombres_mascotas, num_visitas)
plt.xlabel('Mascota')
plt.ylabel('Número de Visitas')
plt.title('Número de Visitas por Mascota')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()

# Mostrar el gráfico
plt.show()

# Cerrar cursor y conexión
cursor.close()
conexion.close()
