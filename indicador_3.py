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

# Indicador 3: Ingresos totales por tipo de medicina
cursor.execute("""
    SELECT nombre_tipo, SUM(precio_medicina)
    FROM Dim_Medicina
    INNER JOIN Hecho_Visita ON Dim_Medicina.id_medicina = Hecho_Visita.fk_medicina
    INNER JOIN tipo ON Dim_Medicina.fk_tipo = tipo.id_tipo
    GROUP BY nombre_tipo
""")
ingresos_por_tipo_medicina = cursor.fetchall()

# Convertir los resultados en listas separadas para el gráfico
nombres_tipos_medicina = [fila[0] for fila in ingresos_por_tipo_medicina]
ingresos = [fila[1] for fila in ingresos_por_tipo_medicina]

# Crear el gráfico de pastel
plt.pie(ingresos, labels=nombres_tipos_medicina, autopct='%1.1f%%')
plt.title('Ingresos Totales por Tipo de Medicina')
plt.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

# Mostrar el gráfico
plt.show()

# Cerrar cursor y conexión
cursor.close()
conexion.close()
