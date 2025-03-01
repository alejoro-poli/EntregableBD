/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package web;

import datos.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addReserva")
public class AddReservaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idReserva = request.getParameter("id_reserva");
        Date fechaReserva = Date.valueOf(request.getParameter("fecha_reserva"));
        int cantPersonas = Integer.parseInt(request.getParameter("cant_personas"));
        String idCliente = request.getParameter("id_cliente");
        String idGuia = request.getParameter("id_guia");
        Timestamp horaReserva = Timestamp.valueOf(request.getParameter("hora_reserva").replace("T", " ") + ":00");
        
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO RESERVAS (ID_RESERVA, FECHA_RESERVA, CANT_PERSONAS, ID_CLIENTE, ID_GUIA, HORA_RESERVA) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, idReserva);
            pstmt.setDate(2, fechaReserva);
            pstmt.setInt(3, cantPersonas);
            pstmt.setString(4, idCliente);
            pstmt.setString(5, idGuia);
            pstmt.setTimestamp(6, horaReserva);
            pstmt.executeUpdate();
            response.sendRedirect("listReservas.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
            if (con != null) try { con.close(); } catch (SQLException ignored) {}
        }
    }
}

