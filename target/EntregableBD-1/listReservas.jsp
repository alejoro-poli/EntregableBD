<%@page import="datos.DBConnection"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Reservas</title>
</head>
<body>
    <h1>Lista de Reservas</h1>
    <table border="1">
        <tr>
            <th>ID Reserva</th>
            <th>Fecha Reserva</th>
            <th>Cantidad Personas</th>
            <th>ID Cliente</th>
            <th>ID Guía</th>
            <th>Hora Reserva</th>
            <th>Acciones</th>
        </tr>
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                con = DBConnection.getConnection();
                String sql = "SELECT * FROM RESERVAS";
                stmt = con.createStatement();
                rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    String idReserva = rs.getString("ID_RESERVA");
                    String fechaReserva = rs.getString("FECHA_RESERVA");
                    int cantPersonas = rs.getInt("CANT_PERSONAS");
                    String idCliente = rs.getString("ID_CLIENTE");
                    String idGuia = rs.getString("ID_GUIA");
                    String horaReserva = rs.getString("HORA_RESERVA");
        %>
        <tr>
            <td><%= idReserva %></td>
            <td><%= fechaReserva %></td>
            <td><%= cantPersonas %></td>
            <td><%= idCliente %></td>
            <td><%= idGuia %></td>
            <td><%= horaReserva %></td>
            <td>
                <a href="editReserva.jsp?id=<%= idReserva %>">Editar</a>
                <a href="deleteReserva?id=<%= idReserva %>">Eliminar</a>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                if (con != null) try { con.close(); } catch (SQLException ignored) {}
            }
        %>
    </table>
    <br>
    <button type="button" onclick="window.location.href='addReserva.jsp'">Agregar Nueva Reserva</button>
</body>
</html>
