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

# Indicador 1: Ingresos totales por veterinario
cursor.execute("""
    SELECT nombre_vet, SUM(precio_medicina)
    FROM Dim_Veterinario
    INNER JOIN Hecho_Visita ON Dim_Veterinario.id_vet = Hecho_Visita.fk_veterinario
    INNER JOIN Dim_Medicina ON Hecho_Visita.fk_medicina = Dim_Medicina.id_medicina
    GROUP BY nombre_vet
""")
ingresos_por_veterinario = cursor.fetchall()

# Convertir los resultados en listas separadas para el gráfico
nombres_veterinarios = [fila[0] for fila in ingresos_por_veterinario]
ingresos = [fila[1] for fila in ingresos_por_veterinario]

# Crear el gráfico de barras
plt.bar(nombres_veterinarios, ingresos)
plt.xlabel('Veterinario')
plt.ylabel('Ingresos Totales')
plt.title('Ingresos Totales por Veterinario')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()

# Mostrar el gráfico
plt.show()

# Cerrar cursor y conexión
cursor.close()
conexion.close()
