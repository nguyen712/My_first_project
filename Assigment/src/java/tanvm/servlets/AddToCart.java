/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tanvm.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tanvm.booking.BookingDTO;
import tanvm.cart.CartObject;

/**
 *
 * @author buikh
 */
public class AddToCart extends HttpServlet {
    private final String USER_PAGE = "user.jsp";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = USER_PAGE;
        String HotelName = request.getParameter("txtHotelName");
        String price = request.getParameter("txtPrice");
        String roomID = request.getParameter("txtRoomID");
        String checkInDate = request.getParameter("txtCheckInDate");
        String checkOutDate = request.getParameter("txtCheckOutDate");
        String email = request.getParameter("txtEmail");
        String searchValue = request.getParameter("lastSearchValue");
        String searchOption = request.getParameter("searchOption");
        try {
            HttpSession session = request.getSession();
            CartObject cart = (CartObject) session.getAttribute("CART");
            if (cart == null) {
                cart = new CartObject();

            }
            String item = request.getParameter("txtBookingID");
            if (item != null) {
                int i = 1;
                BookingDTO dto = new BookingDTO(item, HotelName, i, Date.valueOf(checkInDate), Date.valueOf(checkOutDate), roomID, Integer.parseInt(price), email);
                cart.addItemToCart(dto);
                session.setAttribute("CART", cart);
                url = "DispatchServlet"
                        + "?btAction=Search"
                        + "&txtSearchValue=" + searchValue
                        +"&cboSearch=" + searchOption;
            }
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
