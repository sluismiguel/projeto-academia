public class Cliente {
    private int id;
    private String nome;
    private String telefone;
    private String email;
    private int idade;
    private String observacoes;

    // Construtores, getters e setters
    public Cliente() {}

    public Cliente(int id, String nome, String telefone, String email, int idade, String observacoes) {
        this.id = id;
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
        this.idade = idade;
        this.observacoes = observacoes;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getTelefone() { return telefone; }
    public void setTelefone(String telefone) { this.telefone = telefone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public int getIdade() { return idade; }
    public void setIdade(int idade) { this.idade = idade; }

    public String getObservacoes() { return observacoes; }
    public void setObservacoes(String observacoes) { this.observacoes = observacoes; }
}