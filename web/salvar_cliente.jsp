<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Cliente</title>
    </head>
    <body>
        <%
            // Declarar variáveis
            int telefone, idade;
            String nome, email, observacoes;
            
            // Capturar os parâmetros do formulário
            try {
                nome = request.getParameter("nome");
                telefone = Integer.parseInt(request.getParameter("telefone"));
                idade = Integer.parseInt(request.getParameter("idade"));
                email = request.getParameter("email");
                observacoes = request.getParameter("observacoes");

                // Conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;

                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "mysql");

                // Inserir dados no banco
                String sql = "INSERT INTO clientes (nome, telefone, idade, email, observacoes) VALUES (?, ?, ?, ?, ?)";
                st = conecta.prepareStatement(sql);
                st.setString(1, nome);
                st.setInt(2, telefone);
                st.setInt(3, idade);
                st.setString(4, email);
                st.setString(5, observacoes);

                int rowsInserted = st.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("<p>Cliente cadastrado com sucesso!</p>");
                }

                // Fechar conexão
                st.close();
                conecta.close();
            } catch (NumberFormatException e) {
                out.println("<p>Erro ao converter número. Verifique os campos 'telefone' e 'idade'.</p>");
            } catch (ClassNotFoundException e) {
                out.println("<p>Erro: Driver do banco de dados não encontrado.</p>");
            } catch (SQLException e) {
                out.println("<p>Erro ao salvar os dados no banco de dados.</p>");
            } catch (Exception e) {
                out.println("<p>Erro desconhecido: " + e.getMessage() + "</p>");
            }
        %>
    </body>
</html>
