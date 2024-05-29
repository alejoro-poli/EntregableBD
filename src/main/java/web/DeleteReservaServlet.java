/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package web;

import datos.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteReserva")
public class DeleteReservaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idReserva = request.getParameter("id");

        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBConnection.getConnection();
            String sql = "DELETE FROM RESERVAS WHERE ID_RESERVA = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, idReserva);
            pstmt.executeUpdate();
            response.sendRedirect("listReservas.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DeleteReservaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}

