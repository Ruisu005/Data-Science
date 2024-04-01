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

# Indicador 4: Top 5 de medicinas más recetadas
cursor.execute("""
    SELECT nombre_medicina, COUNT(*) AS num_recetas
    FROM Dim_Medicina
    INNER JOIN Hecho_Visita ON Dim_Medicina.id_medicina = Hecho_Visita.fk_medicina
    GROUP BY nombre_medicina
    ORDER BY num_recetas DESC
    LIMIT 5
""")
top_medicinas_recetadas = cursor.fetchall()

# Convertir los resultados en listas separadas para el gráfico
nombres_medicinas = [fila[0] for fila in top_medicinas_recetadas]
num_recetas = [fila[1] for fila in top_medicinas_recetadas]

# Crear el gráfico de barras
plt.bar(nombres_medicinas, num_recetas)
plt.xlabel('Medicina')
plt.ylabel('Número de Recetas')
plt.title('Top 5 de Medicinas más Recetadas')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()

# Mostrar el gráfico
plt.show()

# Cerrar cursor y conexión
cursor.close()
conexion.close()
