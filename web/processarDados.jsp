<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
        String idadeParam = request.getParameter("idade");
        String email = request.getParameter("email");
        String observacoes = request.getParameter("observacoes");

        // Exibir os dados recebidos
    %>
    <p><strong>Nome:</strong> <%= nome %></p>
    <p><strong>Telefone:</strong> <%= telefone %></p>
    <p><strong>Idade:</strong> <%= idadeParam %></p>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Observações:</strong> <%= observacoes %></p>

    <h3>Processar no Banco de Dados</h3>
    <%
        Connection conecta = null;
        PreparedStatement ps = null;
        int idade = 0;

        try {
            // Validar entrada de idade
            idade = Integer.parseInt(idadeParam);

            // Carregar o driver e conectar ao banco
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/academia?useSSL=false&serverTimezone=UTC";
            String usuario = "root";
            String senha = "mysql";

            conecta = DriverManager.getConnection(url, usuario, senha);

            // Inserir dados
            String sql = "INSERT INTO clientes (nome, telefone, idade, email, observacoes) VALUES (?, ?, ?, ?, ?)";
            ps = conecta.prepareStatement(sql);
            ps.setString(1, nome);
            ps.setString(2, telefone);
            ps.setInt(3, idade);
            ps.setString(4, email);
            ps.setString(5, observacoes);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                out.println("<p>Dados salvos com sucesso no banco de dados!</p>");
            }
        } catch (NumberFormatException e) {
            out.println("<p>Erro: Idade inválida. Por favor, insira um número inteiro.</p>");
        } catch (SQLException e) {
            out.println("<p>Erro ao acessar o banco de dados: " + e.getMessage() + "</p>");
        } catch (ClassNotFoundException e) {
            out.println("<p>Erro: Driver JDBC não encontrado. Verifique a configuração.</p>");
        } catch (Exception e) {
            out.println("<p>Erro inesperado: " + e.getMessage() + "</p>");
        } finally {
            // Fechar recursos
            try {
                if (ps != null) ps.close();
                if (conecta != null) conecta.close();
            } catch (SQLException e) {
                out.println("<p>Erro ao fechar os recursos: " + e.getMessage() + "</p>");
            }
        }
    %>
</body>
</html>
