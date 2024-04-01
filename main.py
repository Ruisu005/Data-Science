import mysql.connector

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
print("Ingresos totales por veterinario:")
for row in ingresos_por_veterinario:
    print(row)

# Indicador 2: Número de visitas por mascota
cursor.execute("""
    SELECT nombre_mascota, COUNT(*) AS numero_visitas
    FROM Dim_Mascota
    INNER JOIN Hecho_Visita ON Dim_Mascota.id_mascota = Hecho_Visita.fk_mascota
    GROUP BY nombre_mascota
""")
visitas_por_mascota = cursor.fetchall()
print("Número de visitas por mascota:")
for row in visitas_por_mascota:
    print(row)

# Indicador 3: Ingresos totales por tipo de medicina
cursor.execute("""
    SELECT nombre_tipo, SUM(precio_medicina) AS ingresos_totales
    FROM Dim_Medicina
    INNER JOIN Hecho_Visita ON Dim_Medicina.id_medicina = Hecho_Visita.fk_medicina
    INNER JOIN tipo ON Dim_Medicina.fk_tipo = tipo.id_tipo
    GROUP BY nombre_tipo
""")
ingresos_por_tipo_medicina = cursor.fetchall()
print("Ingresos totales por tipo de medicina:")
for row in ingresos_por_tipo_medicina:
    print(row)

# Indicador 4: Top 5 de medicinas más recetadas
cursor.execute("""
    SELECT nombre_medicina, COUNT(*) AS total_recetas
    FROM Dim_Medicina
    INNER JOIN Hecho_Visita ON Dim_Medicina.id_medicina = Hecho_Visita.fk_medicina
    GROUP BY nombre_medicina
    ORDER BY total_recetas DESC
    LIMIT 5
""")
top_medicinas_recetadas = cursor.fetchall()
print("Top 5 de medicinas más recetadas:")
for row in top_medicinas_recetadas:
    print(row)

# Indicador 5: Ingresos totales por dueño
cursor.execute("""
    SELECT nombre_dueño, SUM(precio_medicina) AS ingresos_totales
    FROM Dim_Dueño
    INNER JOIN Dim_Mascota ON Dim_Dueño.id_dueño = Dim_Mascota.fk_dueño
    INNER JOIN Hecho_Visita ON Dim_Mascota.id_mascota = Hecho_Visita.fk_mascota
    GROUP BY nombre_dueño
""")
ingresos_por_dueño = cursor.fetchall()
print("Ingresos totales por dueño:")
for row in ingresos_por_dueño:
    print(row)

# Indicador 6: Número de mascotas por dueño
cursor.execute("""
    SELECT nombre_dueño, COUNT(*) AS numero_mascotas
    FROM Dim_Dueño
    INNER JOIN Dim_Mascota ON Dim_Dueño.id_dueño = Dim_Mascota.fk_dueño
    GROUP BY nombre_dueño
""")
mascotas_por_dueño = cursor.fetchall()
print("Número de mascotas por dueño:")
for row in mascotas_por_dueño:
    print(row)

# Cerrar cursor y conexión
cursor.close()
conexion.close()
