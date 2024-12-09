<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Processar Dados</title>
</head>
<body>
    <h2>Dados Recebidos</h2>
    <%
                
        // Capturar os dados do formulário enviados via POST
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String idade = request.getParameter("idade");
        String email = request.getParameter("email");
        String observacoes = request.getParameter("observacoes");

        // Exibir os dados recebidos
    %>
    <p><strong>Nome:</strong> <%= nome %></p>
    <p><strong>Telefone:</strong> <%= telefone %></p>
    <p><strong>Idade:</strong> <%= idade %></p>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Observações:</strong> <%= observacoes %></p>

    <h3>Processar no Banco de Dados</h3>
    <%
        // Conectar ao banco e salvar os dados (exemplo usando JDBC)
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/academia?useSSL=false&serverTimezone=UTC";
            String usuario = "root";
            String senha = "mysql";

Connection conecta = DriverManager.getConnection(url, usuario, senha);

            String sql = "INSERT INTO clientes (nome, telefone, idade, email, observacoes) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conecta.prepareStatement(sql);
            ps.setString(1, nome);
            ps.setString(2, telefone);
            ps.setInt(3, Integer.parseInt(idade));
            ps.setString(4, email);
            ps.setString(5, observacoes);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                out.println("<p>Dados salvos com sucesso no banco de dados!</p>");
            }

            ps.close();
            conecta.close();
        } catch (Exception e) {
            out.println("<p>Erro ao processar os dados: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>
