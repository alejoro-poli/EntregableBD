<%@ page import="java.sql.*, java.text.*, java.util.*" %>
<%
    String idReserva = request.getParameter("id");
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String fechaReserva = "";
    int cantPersonas = 0;
    String idCliente = "";
    String idGuia = "";
    String horaReserva = "";
    try {
        con = DBConnection.getConnection();
        String sql = "SELECT * FROM RESERVAS WHERE ID_RESERVA = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, idReserva);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            fechaReserva = rs.getString("FECHA_RESERVA");
            cantPersonas = rs.getInt("CANT_PERSONAS");
            idCliente = rs.getString("ID_CLIENTE");
            idGuia = rs.getString("ID_GUIA");
            horaReserva = rs.getString("HORA_RESERVA").replace(" ", "T");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
        if (con != null) try { con.close(); } catch (SQLException ignored) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Reserva</title>
</head>
<body>
    <h1>Editar Reserva</h1>
    <form action="updateReserva" method="post">
        ID Reserva: <input type="text" name="id_reserva" value="<%= idReserva %>" readonly><br>
        Fecha Reserva: <input type="date" name="fecha_reserva" value="<%= fechaReserva %>" required><br>
        Cantidad Personas: <input type="number" name="cant_personas" value="<%= cantPersonas %>" required><br>
        ID Cliente: <input type="text" name="id_cliente" value="<%= idCliente %>" required><br>
        ID Guía: <input type="text" name="id_guia" value="<%= idGuia %>" required><br>
        Hora Reserva: <input type="datetime-local" name="hora_reserva" value="<%= horaReserva %>" required><br>
        <input type="submit" value="Actualizar">
        <button type="button" onclick="window.location.href='listReservas.jsp'">Cancelar</button>
    </form>
</body>
</html>

