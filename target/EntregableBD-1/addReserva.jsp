<!DOCTYPE html>
<html>
<head>
    <title>Agregar Reserva</title>
</head>
<body>
    <h1>Agregar Nueva Reserva</h1>
    <form action="addReserva" method="post">
        ID Reserva: <input type="text" name="id_reserva" required><br>
        Fecha Reserva: <input type="date" name="fecha_reserva" required><br>
        Cantidad Personas: <input type="number" name="cant_personas" required><br>
        ID Cliente: <input type="text" name="id_cliente" required><br>
        ID Guía: <input type="text" name="id_guia" required><br>
        Hora Reserva: <input type="datetime-local" name="hora_reserva" required><br>
        <input type="submit" value="Agregar">
        <button type="button" onclick="window.location.href='listReservas.jsp'">Cancelar</button>
    </form>
</body>
</html>

